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
  var _practiceBsAllHands;
  var _practiceBsHardHands;
  var _practiceBsSoftHands;
  var _practiceBsSplitHands;
  var _practiceIllustrious18;
  var _practiceFab4;
  var _practiceInsurance;
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
    fetchCardData();
    shuffleDeck();
    monitorBasicStrategeyCubit();
    monitorGameSettingsCubit();
  }

  StreamSubscription<BasicStrategeyState> monitorBasicStrategeyCubit() {
    dealStartingHand(); //* Deals Cards initially on BS trainer screen mount
    return basicStrategeyStreamSubscription =
        basicStrategeyCubit.stream.listen((basicStrategeyState) {
      if (basicStrategeyState.didChoosePlay == true) {
        dealStartingHand(); //* Deals cards again each time a BS button action is chosen.
      }
    });
  }

  StreamSubscription<BasicStrategeySettingsState> monitorGameSettingsCubit() {
    // * If the user changes the deck quantity or pennetration in settings, it will adjust the deck accordingly.
    return gameSettingsStreamSubscription = basicStrategeySettingsCubit.stream
        .listen((basicStrategeyGameSettingsState) {
      _deckQuantity = basicStrategeyGameSettingsState.deckQuantity;
      _deckPenetration = basicStrategeyGameSettingsState.deckPenetration;
      _practiceBsAllHands = basicStrategeyGameSettingsState.practiceBsAllHands;
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

      shuffleDeck();
      dealStartingHand();
    });
  }

  Future<List> fetchCardData() async {
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

  void shuffleDeck() {
    print('************ SHUFFLE **************');
    int counter = 0;
    List tempDeck = [];
    while (counter < _deckQuantity.round()) {
      var newDeck = state.deckRepository;
      newDeck.shuffle();
      tempDeck.add(newDeck);
      counter++;
    }
    var shuffledDeck = tempDeck.expand((i) => i).toList();
    for (var i = 0; i < shuffledDeck.length; i++) {
      // * Resets all cards in deck:
      shuffledDeck[i].isHoleCard = false;
    }
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

  dealStartingHand() {
    if (state.dealtCards.length > state.cutCardIndex) shuffleDeck();
    List handsDealt = [];
    int fakeTrueCount = 0;

    if (_practiceBsHardHands == true) {
      handsDealt = dealHardHand();
    } else if (_practiceBsSoftHands == true) {
      handsDealt = dealSoftHand();
    } else if (_practiceBsSplitHands == true) {
      handsDealt = dealSplitHand();
    } else if (_practiceIllustrious18 == true) {
      handsDealt = dealIllustruous18Hand();
      fakeTrueCount = generateRandomTrueCount();
    } else if (_practiceFab4 == true) {
      handsDealt = dealFab4Hand();
      fakeTrueCount = generateRandomTrueCount();
    } else if (_practiceInsurance == true) {
      handsDealt = dealInsuranceHand();
      fakeTrueCount = generateRandomTrueCount();
    } else {
      handsDealt = dealRandomHand();
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

  dealRandomHand() {
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

  dealSplitHand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First 2 cards to each dealer and first card to player
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
    // Finds a mathing pair for players last card
    var secondPlayerCard = tempRemainingCards
        .firstWhere((i) => i.value == tempPlayerHand[0].value);
    var matchedIndex = tempRemainingCards.indexOf(secondPlayerCard);
    tempRemainingCards.remove(matchedIndex);
    tempPlayerHand.add(secondPlayerCard);
    dealtCards.add(secondPlayerCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  dealSoftHand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First 2 cards to each dealer and first card to player
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
    // Finds an 11 for players last card
    var playerSecondCard = tempRemainingCards.firstWhere((i) => i.value == 11);
    var matchedIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(matchedIndex);
    tempPlayerHand.add(playerSecondCard);
    tempPlayerHand
        .shuffle(); // To randomize the position of the ace on the screen
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  dealHardHand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First 2 cards to dealer
    for (int i = 0; i < 2; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 2);
    // Finds an Non 11 for players first card
    var playerFirstCard = tempRemainingCards.firstWhere((i) => i.value != 11);
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);
    // Finds an Non 11 and non pair for players second card
    var playerSecondCard = tempRemainingCards
        .firstWhere((i) => i.value != 11 && i.value != tempPlayerHand[0].value);
    var patcheSeconddIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(patcheSeconddIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  dealIllustruous18Hand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    // Finds an dealer face up card that is not 8
    var dealerSecondCard = tempRemainingCards.firstWhere((i) => i.value != 8);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);

    var dealerFaceCard = tempDealerHand[1].value;

    // Hand options:
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
    ]; // if dealer has these, player first card can be any except 11
    List dealerOptions2 = [
      4,
      5,
      6
    ]; // if dealer has these, player first card can 2-10
    List dealerOptions3 = [7]; // if dealer has these, player first card can 2-7
    List dealerOptions4 = [
      11
    ]; // if dealer has these, player first card can 2-8

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

  dealFab4Hand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    // Finds an 9,10,or 11 for dealer face up card
    var dealerSecondCard = tempRemainingCards
        .firstWhere((i) => i.value == 9 || i.value == 10 || i.value == 11);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);

    // if dealer has 10, player can have 14 or 15
    // if dealer has any other card, player must have 15
    int requestedPlayerTotal = 0;
    if (tempDealerHand[1].value == 9 || tempDealerHand[1].value == 11) {
      requestedPlayerTotal = 15;
    } else {
      final random = Random();
      final min = 14;
      final max = 16;
      requestedPlayerTotal = min + random.nextInt(max - min);
    }

    // Finds the players first card that can total to 15
    var playerFirstCard = tempRemainingCards.firstWhere((i) => i.value >= 5 && i.value < 11);
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);
    // Finds the players second card where the total will match the desired
    var requestedSecondCard = requestedPlayerTotal - tempPlayerHand[0].value;
    var playerSecondCard =
        tempRemainingCards.firstWhere((i) => i.value == requestedSecondCard);
    var matchedSecondIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(matchedSecondIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  dealInsuranceHand() {
    resetDealerHoleCards();
    var tempRemainingCards = state.shuffledDeck;
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    // Deals First card to dealer
    for (int i = 0; i < 1; i++) {
      if (i == 0) tempRemainingCards[i].isHoleCard = true;
      tempDealerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 1);

    // Finds an 11 for dealer face up card
    var dealerSecondCard = tempRemainingCards.firstWhere((i) => i.value == 11);
    var dealerSecondCardIndex = tempRemainingCards.indexOf(dealerSecondCard);
    tempRemainingCards.remove(dealerSecondCardIndex);
    tempDealerHand.add(dealerSecondCard);
    dealtCards.add(dealerSecondCard);

    // Deals 2 cards to player
    for (int i = 0; i < 2; i++) {
      tempPlayerHand.add(tempRemainingCards[i]);
      dealtCards.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 2);
    return [tempDealerHand, tempPlayerHand, dealtCards];
  }

  void resetDealerHoleCards() {
    if (state.dealtCards.isNotEmpty) {
      for (var i = 0; i < state.dealtCards.length; i++) {
        state.dealtCards[i].isHoleCard = false;
      }
    }
  }

  generateRandomTrueCount() {
    final random = Random();
    final min = -10;
    final max = 10;
    return min + random.nextInt(max - min);
  }

  @override
  Future<void> close() {
    basicStrategeyStreamSubscription.cancel();
    gameSettingsStreamSubscription.cancel();
    return super.close();
  }
}
