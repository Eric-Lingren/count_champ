import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/raw_deck_data.dart';
import 'package:count_champ/logic/cubits/basic_strategey_cubit/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategey_settings_cubit/basic_strategey_settings_cubit.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:equatable/equatable.dart';
part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  double _deckQuantity = 8.0;
  double _deckPenetration = 80.0;
  late bool _practiceBsHardHands = false;
  late bool _practiceBsSoftHands = false;
  late bool _practiceBsSplitHands = false;
  late bool _practiceIllustrious18 = false;
  late bool _practiceFab4 = false;
  late bool _practiceInsurance = false;
  final BasicStrategeyCubit basicStrategeyCubit;
  late StreamSubscription basicStrategeyStreamSubscription;
  final BasicStrategeySettingsCubit basicStrategeySettingsCubit;
  late StreamSubscription gameSettingsStreamSubscription;

  DeckCubit(
      {required this.basicStrategeyCubit,
      basicStrategeyStreamSubscription,
      required this.basicStrategeySettingsCubit,
      gameSettingsStreamSubscription})
      : super(DeckState(
            deckRepository: const [],
            shuffledDeck: const [],
            cutCardIndex: 0,
            dealtCards: const [],
            dealerHand: const [],
            playerHand: const [],
            trueCount: 0)) {
    _fetchCardData();
    _shuffleDeck();
    _monitorBasicStrategeyCubit();
    _monitorBasicStrategeySettingsCubit();
  }

  StreamSubscription<BasicStrategeyState> _monitorBasicStrategeyCubit() {
    _dealStartingHand(); //* Deals Cards initially on BS trainer screen mount
    return basicStrategeyStreamSubscription =
        basicStrategeyCubit.stream.listen((basicStrategeyState) {
      if (basicStrategeyState.didChoosePlay == true) {
        _dealStartingHand(); //* Deals cards again each time a BS button action is chosen.
      }
    });
  }

  StreamSubscription<BasicStrategeySettingsState> _monitorBasicStrategeySettingsCubit() {
    // * If the user changes the settings, it will adjust the deck accordingly.
    return gameSettingsStreamSubscription = basicStrategeySettingsCubit.stream
        .listen((basicStrategeyGameSettingsState) {
      _deckQuantity = basicStrategeyGameSettingsState.deckQuantity;
      _deckPenetration = basicStrategeyGameSettingsState.deckPenetration;
      _practiceBsHardHands =
          basicStrategeyGameSettingsState.practiceBsHardHands;
      _practiceBsSoftHands =
          basicStrategeyGameSettingsState.practiceBsSoftHands;
      _practiceBsSplitHands =
          basicStrategeyGameSettingsState.practiceBsSplitHands;
      _practiceIllustrious18 =
          basicStrategeyGameSettingsState.practiceIllustrious18;
      _practiceFab4 = basicStrategeyGameSettingsState.practiceFab4;
      _practiceInsurance = basicStrategeyGameSettingsState.practiceInsurance;
      _shuffleDeck();
      _dealStartingHand();
    });
  }

  Future<List> _fetchCardData() async {
    List cards =
        rawDeckData.map((data) => CardDataTemplate.fromJson(data)).toList();
    _setCardList(cards);
    return cards;
  }

  void _setCardList(cards) => emit(DeckState(
        deckRepository: cards,
        shuffledDeck: const [],
        dealtCards: const [],
        dealerHand: const [],
        playerHand: const [],
        cutCardIndex: 0,
        trueCount: state.trueCount,
      ));

  void _shuffleDeck() {
    int counter = 0;
    List tempDeck = [];
    while (counter < _deckQuantity.round()) {
      var newDeck = state.deckRepository;
      newDeck.shuffle();
      tempDeck.add(newDeck);
      counter++;
    }
    var shuffledDeck = tempDeck.expand((i) => i).toList();
    _resetDealerHoleCards();
    _initPlayableCards(shuffledDeck);
  }

  _initPlayableCards(shuffledDeck) {
    // * Sets the max allowable cards that can be dealt out of the deck after shuffle
    // * Contingent upon deck quantity and deck penetration (cut card depth).
    double deckPenetration = _deckPenetration / 100; // * range from .1-.8
    double availableCardsQuantity = shuffledDeck.length * deckPenetration;
    int cutCardIndex = availableCardsQuantity.floor();
    _setPlayableCards(shuffledDeck, cutCardIndex);
  }

  void _setPlayableCards(shuffledDeck, cutCardIndex) => emit(DeckState(
        deckRepository: state.deckRepository,
        shuffledDeck: shuffledDeck,
        dealtCards: const [],
        cutCardIndex: cutCardIndex,
        dealerHand: const [],
        playerHand: const [],
        trueCount: state.trueCount,
      ));

  _dealStartingHand() {
    if (state.dealtCards.length > state.cutCardIndex) _shuffleDeck();
    List handsDealt = [];
    int fakeTrueCount = 0;
    //* Deals custom hand types for Basic Strategey Trainer
    if (_practiceBsHardHands == true) {
      handsDealt = _dealHardHand();
    } else if (_practiceBsSoftHands == true) {
      handsDealt = _dealSoftHand();
    } else if (_practiceBsSplitHands == true) {
      handsDealt = _dealSplitHand();
    } else if (_practiceIllustrious18 == true) {
      handsDealt = _dealIllustruous18Hand();
      fakeTrueCount = _generateRandomTrueCount();
    } else if (_practiceFab4 == true) {
      handsDealt = _dealFab4Hand();
      fakeTrueCount = _generateRandomTrueCount();
    } else if (_practiceInsurance == true) {
      handsDealt = _dealInsuranceHand();
      fakeTrueCount = _generateRandomTrueCount();
    } else {
      //* Deals standard random statring hand from the deck
      handsDealt = _dealRandomHand();
    }
    emit(DeckState(
      deckRepository: state.deckRepository,
      shuffledDeck: state.shuffledDeck,
      cutCardIndex: state.cutCardIndex,
      dealerHand: handsDealt[0],
      playerHand: handsDealt[1],
      dealtCards: [...state.dealtCards, ...handsDealt[2]],
      trueCount: fakeTrueCount,
    ));
  }

  _dealRandomHand() {
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    for (int i = 0; i < 4; i++) {
      if (i.isEven) {
        if (i == 0) tempRemainingCards[i].isHoleCard = true;
        tempDealerHand.add(tempRemainingCards[i]);
      } else {
        tempPlayerHand.add(tempRemainingCards[i]);
      }
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 4);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealSplitHand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals First 2 cards to each dealer and first card to player
    for (int i = 0; i < 3; i++) {
      if (i.isEven) {
        if (i == 0) tempRemainingCards[i].isHoleCard = true;
        tempDealerHand.add(tempRemainingCards[i]);
      } else {
        tempPlayerHand.add(tempRemainingCards[i]);
      }
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 3);
    //* Finds a mathing pair for players last card
    var secondPlayerCard = tempRemainingCards
        .firstWhere((i) => i.value == tempPlayerHand[0].value);
    var matchedIndex = tempRemainingCards.indexOf(secondPlayerCard);
    tempRemainingCards.remove(matchedIndex);
    tempPlayerHand.add(secondPlayerCard);
    dealtCards.add(secondPlayerCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealSoftHand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals First 2 cards to each dealer and first card to player
    for (int i = 0; i < 3; i++) {
      if (i.isEven) {
        if (i == 0) tempRemainingCards[i].isHoleCard = true;
        tempDealerHand.add(tempRemainingCards[i]);
      } else {
        tempPlayerHand.add(tempRemainingCards[i]);
      }
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 3);
    //* Finds an 11 for players last card
    var playerSecondCard = tempRemainingCards.firstWhere((i) => i.value == 11);
    var matchedIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(matchedIndex);
    tempPlayerHand.add(playerSecondCard);
    tempPlayerHand .shuffle(); //* Randomize the the ace location on the screen
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealHardHand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals First 2 cards to dealer
    for (int i = 0; i < 2; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 2);
    //* Finds an Non 11 for players first card
    var playerFirstCard = tempRemainingCards.firstWhere((i) => i.value != 11);
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);
    //* Finds an Non 11 and non pair for players second card
    var playerSecondCard = tempRemainingCards
        .firstWhere((i) => i.value != 11 && i.value != tempPlayerHand[0].value);
    var patcheSeconddIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(patcheSeconddIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealIllustruous18Hand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals First card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    //* Finds an dealer face up card that is not 8
    var dealerSecondCard = tempRemainingCards.firstWhere((i) => i.value != 8);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);
    var dealerFaceCard = tempDealerHand[1].value;

    //* Hand options:
    // dealer = 2 ; player = 9 || 13   any
    // dealer = 3 ; player = 12 || 13  any
    // dealer = 4 ; player = 12  2-10
    // dealer = 5 ; player = 10 + 10 || 12  2-10
    // dealer = 6 ; player = 10 + 10 || 12  2-10
    // dealer = 7 ; player = 9    2-7
    // dealer = 9 ; player = 16  any
    // dealer = 10 ; player = 16 || 15 || 10  any
    // dealer = 11 ; player = 10  2-8

    List dealerOptions1 = [
      2,
      3,
      9,
      10
    ]; //* If dealer has these, player first card can be any except 11
    List dealerOptions2 = [
      4,
      5,
      6
    ]; //* If dealer has these, player first card can 2-10
    List dealerOptions3 = [7]; // if dealer has these, player first card can 2-7
    List dealerOptions4 = [
      11
    ]; //* If dealer has these, player first card can 2-8

    bool dealerMatchingList1 = dealerOptions1.contains(dealerFaceCard);
    bool dealerMatchingList2 = dealerOptions2.contains(dealerFaceCard);
    bool dealerMatchingList3 = dealerOptions3.contains(dealerFaceCard);
    bool dealerMatchingList4 = dealerOptions4.contains(dealerFaceCard);

    //* Sets the players first card
    var playerFirstCard;
    if (dealerMatchingList1 == true) {
      if (dealerFaceCard == 9) {
        playerFirstCard = tempRemainingCards
            .firstWhere((i) => i.value >= 2 && i.value != 8 && i.value < 11);
      } else {
        playerFirstCard =
            tempRemainingCards.firstWhere((i) => i.value >= 2 && i.value < 11);
      }
    }
    if (dealerMatchingList2 == true) {
      if (dealerFaceCard == 4 || dealerFaceCard == 5 || dealerFaceCard == 6) {
        playerFirstCard = tempRemainingCards
            .firstWhere((i) => i.value >= 2 && i.value <= 10 && i.value != 6);
      } else {
        playerFirstCard =
            tempRemainingCards.firstWhere((i) => i.value >= 2 && i.value <= 10);
      }
    }
    if (dealerMatchingList3 == true) {
      playerFirstCard =
          tempRemainingCards.firstWhere((i) => i.value >= 2 && i.value <= 7);
    }
    if (dealerMatchingList4 == true) {
      playerFirstCard = tempRemainingCards
          .firstWhere((i) => i.value >= 2 && i.value <= 8 && i.value != 5);
    }
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);

    //* Sets the players second card
    var playerSecondCard;
    if (dealerFaceCard == 2) {
      playerSecondCard = tempRemainingCards.firstWhere((i) =>
          ((i.value + tempPlayerHand[0].value == 9) ||
              (i.value + tempPlayerHand[0].value == 13) && i.value != 11));
    }
    if (dealerFaceCard == 3) {
      playerSecondCard = tempRemainingCards.firstWhere((i) =>
          (((i.value + tempPlayerHand[0].value == 12) ||
                  (i.value + tempPlayerHand[0].value == 13)) &&
              i.value != tempPlayerHand[0].value));
    }
    if (dealerFaceCard == 4) {
      playerSecondCard = tempRemainingCards
          .firstWhere((i) => (i.value + tempPlayerHand[0].value == 12));
    }
    if (dealerFaceCard == 5 || dealerFaceCard == 6) {
      if (tempPlayerHand[0].value == 10) {
        playerSecondCard =
            tempRemainingCards.firstWhere((i) => i.value == 10 || i.value == 2);
      } else {
        playerSecondCard = tempRemainingCards
            .firstWhere((i) => ((i.value + tempPlayerHand[0].value == 12)));
      }
    }
    if (dealerFaceCard == 7) {
      playerSecondCard = tempRemainingCards
          .firstWhere((i) => (i.value + tempPlayerHand[0].value == 9));
    }
    if (dealerFaceCard == 9) {
      playerSecondCard = tempRemainingCards
          .firstWhere((i) => i.value + tempPlayerHand[0].value == 16);
    }
    if (dealerFaceCard == 10) {
      playerSecondCard = tempRemainingCards.firstWhere((i) =>
          (((i.value + tempPlayerHand[0].value == 16) ||
                  (i.value + tempPlayerHand[0].value == 15) ||
                  (i.value + tempPlayerHand[0].value == 10)) &&
              i.value != tempPlayerHand[0].value));
    }
    if (dealerFaceCard == 11) {
      playerSecondCard = tempRemainingCards
          .firstWhere((i) => i.value + tempPlayerHand[0].value == 10);
    }

    var matchedSecondIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(matchedSecondIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealFab4Hand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals First card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    //* Finds an 9,10,or 11 for dealer face up card
    var dealerSecondCard = tempRemainingCards
        .firstWhere((i) => i.value == 9 || i.value == 10 || i.value == 11);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);

    //* If dealer has 10, player can have 14 or 15
    //* If dealer has any other card, player must have 15
    int requestedPlayerTotal = 0;
    if (tempDealerHand[1].value == 9 || tempDealerHand[1].value == 11) {
      requestedPlayerTotal = 15;
    } else {
      final random = Random();
      final min = 14;
      final max = 16;
      requestedPlayerTotal = min + random.nextInt(max - min);
    }

    //* Finds the players first card that can total to 15
    var playerFirstCard =
        tempRemainingCards.firstWhere((i) => i.value >= 5 && i.value < 11);
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);
    //* Finds the players second card where the total will match the desired
    var requestedSecondCard = requestedPlayerTotal - tempPlayerHand[0].value;
    var playerSecondCard =
        tempRemainingCards.firstWhere((i) => i.value == requestedSecondCard);
    var matchedSecondIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(matchedSecondIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  _dealInsuranceHand() {
    _resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    //* Deals random first card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    //* Finds an 11 for dealer face up card
    var dealerSecondCard = tempRemainingCards.firstWhere((i) => i.value == 11);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);

    //* Deals 2 random cards to player
    for (int i = 0; i < 2; i++) {
      tempPlayerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 2);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  //* Removes 'hole cards' from deck
  void _resetDealerHoleCards() {
    if (state.dealtCards.isNotEmpty) {
      for (var i = 0; i < state.dealtCards.length; i++) {
        state.dealtCards[i].isHoleCard = false;
      }
    }
  }

  _generateRandomTrueCount() {
    final random = Random();
    const min = -10;
    const max = 10;
    return min + random.nextInt(max - min);
  }

  @override
  Future<void> close() {
    basicStrategeyStreamSubscription.cancel();
    gameSettingsStreamSubscription.cancel();
    return super.close();
  }
}
