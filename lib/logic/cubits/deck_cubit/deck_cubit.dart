import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/raw_deck_data.dart';
import 'package:count_champ/logic/cubits/basic_strategey_cubit/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/game_settings_cubit/game_settings_cubit.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:equatable/equatable.dart';
part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  double _deckQuantity = 8.0;
  double _deckPenetration = 80.0;
  // bool _practiceBsHardHands = false;
  // bool _practiceBsSoftHands = false;
  // bool _practiceBsSplitHands = false;
  var _practiceBsHardHands;
  var _practiceBsSoftHands;
  var _practiceBsSplitHands;
  final BasicStrategeyCubit basicStrategeyCubit;
  late StreamSubscription basicStrategeyStreamSubscription;
  final GameSettingsCubit gameSettingsCubit;
  late StreamSubscription gameSettingsStreamSubscription;

  DeckCubit(
      {required this.basicStrategeyCubit,
      basicStrategeyStreamSubscription,
      required this.gameSettingsCubit,
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

  StreamSubscription<GameSettingsState> monitorGameSettingsCubit() {
    // * If the user changes the deck quantity or pennetration in settings, it will adjust the deck accordingly.
    return gameSettingsStreamSubscription =
        gameSettingsCubit.stream.listen((gameSettingsState) {
      _deckQuantity = gameSettingsState.deckQuantity;
      _deckPenetration = gameSettingsState.deckPenetration;
      _practiceBsHardHands = gameSettingsState.practiceBsHardHands;
      _practiceBsSoftHands = gameSettingsState.practiceBsSoftHands;
      _practiceBsSplitHands = gameSettingsState.practiceBsSplitHands;

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
    // * Deals 2 cards to each person (dealer and player)
    // * First card face up to player, Second card face down to dealer
    // * Third card face up to player, Fourth card face up to dealer
    if (state.dealtCards.length > state.cutCardIndex) shuffleDeck();


    List handsDealt = [];

    // if (_practiceBsHardHands != true &&
    //     _practiceBsSoftHands != true &&
    //     _practiceBsSplitHands != true) {
    //   handsDealt = dealRandomHand();
    // }
    // if (_practiceBsHardHands == true) {
    //   handsDealt = dealHardHand();
    // }
    // if (_practiceBsSoftHands == true) {
    //   handsDealt = dealSoftHand();
    // }
    // if (_practiceBsSplitHands == true) {
    //   handsDealt = dealSplitHand();
    // }
    handsDealt = dealFab4Hand();


    int fakeTrueCount = generateRandomTrueCount();

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
    // print('RANOM HAND!!!!');
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

    // Finds an 9,10,0r 11 for dealer face up card
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
    var playerFirstCard = tempRemainingCards.firstWhere((i) => i.value >= 4);
    var firstMatchedIndex = tempRemainingCards.indexOf(playerFirstCard);
    tempRemainingCards.remove(firstMatchedIndex);
    tempPlayerHand.add(playerFirstCard);
    dealtCards.add(playerFirstCard);
    // Finds the players second card where the total will match the desired
    var requestedSecondCard = requestedPlayerTotal - tempPlayerHand[0].value;
    var playerSecondCard = tempRemainingCards
        .firstWhere((i) => i.value == requestedSecondCard);
    var patcheSeconddIndex = tempRemainingCards.indexOf(playerSecondCard);
    tempRemainingCards.remove(patcheSeconddIndex);
    tempPlayerHand.add(playerSecondCard);
    dealtCards.add(playerSecondCard);
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
