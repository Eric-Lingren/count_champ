import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/raw_deck_data.dart';
import 'package:count_champ/data/models/counting_systems/ace_five_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/canfield_expert_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/canfield_master_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/halves_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/hilo_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/hiopt1_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/hiopt2_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/kiss1_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/kiss2_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/kiss3_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/ko_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/mentor_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/omega2_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/red7_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/reko_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/revere_14_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/revere_adv_plus_minus_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/revere_apc_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/revere_point_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/silver_fox_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/thorps_10_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/ubz2_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/uston_adv_plus_minus_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/uston_apc_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/uston_ss_count_generator.dart';
import 'package:count_champ/data/models/counting_systems/zen_count_generator.dart';
import 'package:count_champ/logic/cubits/basic_strategy_cubit/basic_strategy_cubit.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:equatable/equatable.dart';
part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  double _deckQuantity = 8.0;
  double _deckPenetration = 80.0;
  double _runningCountOffest = 0.0;
  late bool _practiceBsHardHands = false;
  late bool _practiceBsSoftHands = false;
  late bool _practiceBsSplitHands = false;
  late bool _practiceIllustrious18 = false;
  late bool _practiceFab4 = false;
  late bool _practiceInsurance = false;
  late bool _isShowingCount = true; // ToDo - get the default another way
  late bool _isDealingOneCard = true;
  late bool _isDealingTwoCards = false;
  late bool _hiLoEnabled = true; // ToDo - get the default another way
  late bool _hiOpt1Enabled = false;
  late bool _hiOpt2Enabled = false;
  late bool _halvesEnabled = false;
  late bool _koEnabled = false;
  late bool _red7Enabled = false;
  late bool _zenEnabled = false;
  late bool _omegaEnabled = false;
  late bool _thorps10Enabled = false;
  late bool _acefiveEnabled = false;
  late bool _kiss1Enabled = false;
  late bool _kiss2Enabled = false;
  late bool _kiss3Enabled = false;
  late bool _canfieldExpertEnabled = false;
  late bool _canfieldMasterEnabled = false;
  late bool _mentorEnabled = false;
  late bool _rekoEnabled = false;
  late bool _silverFoxEnabled = false;
  late bool _ubz2Enabled = false;
  late bool _revereAdvPlusMinusEnabled = false;
  late bool _reverePointCountEnabled = false;
  late bool _revereApcEnabled = false;
  late bool _revere14Enabled = false;
  late bool _ustonAdvPlusMinusEnabled = false;
  late bool _ustonApcEnabled = false;
  late bool _ustonSsEnabled = false;
  final BasicStrategyCubit basicStrategyCubit;
  late StreamSubscription basicStrategyStreamSubscription;
  final BasicStrategySettingsCubit basicStrategySettingsCubit;
  late StreamSubscription gameSettingsStreamSubscription;
  final CountCubit countCubit;
  late StreamSubscription countStreamSubscription;
  final CountSettingsCubit countSettingsCubit;
  late StreamSubscription countSettingsStreamSubscription;

  DeckCubit({
    required this.basicStrategyCubit,
    basicStrategyStreamSubscription,
    required this.basicStrategySettingsCubit,
    gameSettingsStreamSubscription,
    required this.countCubit,
    countStreamSubscription,
    required this.countSettingsCubit,
    countSettingsStreamSubscription,
  }) : super(DeckState(
            deckRepository: const [],
            shuffledDeck: const [],
            cutCardIndex: 0,
            dealtCards: const [],
            dealerHand: const [],
            playerHand: const [],
            trueCount: 0,
            runningCount: 0)) {
    _fetchCardData();
    shuffleDeck();
    _monitorBasicStrategyCubit();
    _monitorBasicStrategySettingsCubit();
    _monitorCountCubit();
    _monitorCountSettingsCubit();
  }

  StreamSubscription<BasicStrategyState> _monitorBasicStrategyCubit() {
    // _dealStartingHand(); //* Deals Cards initially on BS trainer screen mount
    return basicStrategyStreamSubscription =
        basicStrategyCubit.stream.listen((basicStrategyState) {
      if (basicStrategyState.didChoosePlay == true) {
        _dealStartingHand(); //* Deals cards again each time a BS button action is chosen.
      }
    });
  }

  StreamSubscription<BasicStrategySettingsState>
      _monitorBasicStrategySettingsCubit() {
    // * If the user changes the settings, it will adjust the deck accordingly.
    return gameSettingsStreamSubscription = basicStrategySettingsCubit.stream
        .listen((basicStrategyGameSettingsState) {
      _deckQuantity = basicStrategyGameSettingsState.deckQuantity;
      _deckPenetration = basicStrategyGameSettingsState.deckPenetration;
      _practiceBsHardHands = basicStrategyGameSettingsState.practiceBsHardHands;
      _practiceBsSoftHands = basicStrategyGameSettingsState.practiceBsSoftHands;
      _practiceBsSplitHands =
          basicStrategyGameSettingsState.practiceBsSplitHands;
      _practiceIllustrious18 =
          basicStrategyGameSettingsState.practiceIllustrious18;
      _practiceFab4 = basicStrategyGameSettingsState.practiceFab4;
      _practiceInsurance = basicStrategyGameSettingsState.practiceInsurance;
      shuffleDeck();
      _dealStartingHand();
    });
  }

  StreamSubscription<CountState> _monitorCountCubit() {
    // _dealOneCard('player'); //* Deals one card initially on count trainer mount
    return countStreamSubscription = countCubit.stream.listen((countState) {
      if (countState.didDeal == true) {
        if(_isDealingOneCard == true) _dealOneCard('player'); 
        if(_isDealingTwoCards == true) _dealTwoCards('player'); 
      }
    });
  }

  StreamSubscription<CountSettingsState> _monitorCountSettingsCubit() {
    return countSettingsStreamSubscription =
        countSettingsCubit.stream.listen((countSettingsState) {
      _deckQuantity = countSettingsState.deckQuantity;
      _deckPenetration = countSettingsState.deckPenetration;
      _isDealingOneCard = countSettingsState.isDealingOneCard;
      _isDealingTwoCards = countSettingsState.isDealingTwoCards;
      _hiLoEnabled = countSettingsState.hiLoEnabled;
      _hiOpt1Enabled = countSettingsState.hiOpt1Enabled;
      _hiOpt2Enabled = countSettingsState.hiOpt2Enabled;
      _halvesEnabled = countSettingsState.halvesEnabled;
      _koEnabled = countSettingsState.koEnabled;
      _red7Enabled = countSettingsState.red7Enabled;
      _zenEnabled = countSettingsState.zenEnabled;
      _omegaEnabled = countSettingsState.omega2Enabled;
      _thorps10Enabled = countSettingsState.thorps10Enabled;
      _acefiveEnabled = countSettingsState.acefiveEnabled;
      _kiss1Enabled = countSettingsState.kiss1Enabled;
      _kiss2Enabled = countSettingsState.kiss2Enabled;
      _kiss3Enabled = countSettingsState.kiss3Enabled;
      _canfieldExpertEnabled = countSettingsState.canfieldExpertEnabled;
      _canfieldMasterEnabled = countSettingsState.canfieldMasterEnabled;
      _mentorEnabled = countSettingsState.mentorEnabled;
      _rekoEnabled = countSettingsState.rekoEnabled;
      _silverFoxEnabled = countSettingsState.silverFoxEnabled;
      _ubz2Enabled = countSettingsState.ubz2Enabled;
      _revereAdvPlusMinusEnabled = countSettingsState.revereAdvPlusMinusEnabled;
      _reverePointCountEnabled = countSettingsState.reverePointCountEnabled;
      _revereApcEnabled = countSettingsState.revereApcEnabled;
      _revere14Enabled = countSettingsState.revere14Enabled;
      _ustonAdvPlusMinusEnabled = countSettingsState.ustonAdvPlusMinusEnabled;
      _ustonApcEnabled = countSettingsState.ustonApcEnabled;
      _ustonSsEnabled = countSettingsState.ustonSsEnabled;

      _setStartingCountOffeset();
      //* Dont shuffle the deck if no settings changed other than show count:
      if (_isShowingCount == countSettingsState.showCount) shuffleDeck();
      //* Else Shuffle Deck:
      _isShowingCount = countSettingsState.showCount;
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
        trueCount: 0,
        runningCount: 0,
      ));

  void shuffleDeck() {
    int counter = 0;
    List shuffledDeck = [];
    while (counter < _deckQuantity.round()) {
      var shuffled52CardDeck = state.deckRepository;
      shuffled52CardDeck.shuffle();
      shuffledDeck = [...shuffledDeck, ...shuffled52CardDeck];
      counter++;
    }

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
        trueCount: 0,
        runningCount: _runningCountOffest,
      ));

  _dealStartingHand() {
    if (state.dealtCards.length > state.cutCardIndex) shuffleDeck();

    List handsDealt = [];
    int fakeTrueCount = 0;
    //* Deals custom hand types for Basic Strategy Trainer
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
      trueCount:
          fakeTrueCount, // Todo figure out how to use fake and true (bs vs game)
      runningCount: 0, // TODO Connect Running count here
    ));
  }

  _dealOneCard(toWhom) {
    var tempRemainingCards = state.shuffledDeck;

    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    if (toWhom == 'player') {
      tempPlayerHand.add(tempRemainingCards[0]);
      tempDealerHand = state.dealerHand;
    }
    if (toWhom == 'dealer') {
      tempDealerHand.add(tempRemainingCards[0]);
      tempPlayerHand = state.playerHand;
    }
    dealtCards.add(tempRemainingCards[0]);
    double runningCountValue = _calculateRunningCount(tempRemainingCards[0]);
    tempRemainingCards.removeRange(0, 1);
    double newRunningCount = state.runningCount + runningCountValue;

    emit(DeckState(
      deckRepository: state.deckRepository,
      shuffledDeck: state.shuffledDeck,
      cutCardIndex: state.cutCardIndex,
      dealerHand: tempDealerHand,
      playerHand: tempPlayerHand,
      dealtCards: [...state.dealtCards, ...dealtCards],
      trueCount: 0, // Todo set this count for real
      runningCount: newRunningCount,
    ));
  }

  _dealTwoCards(toWhom) {
    var tempRemainingCards = state.shuffledDeck;

    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    if (toWhom == 'player') {
      tempPlayerHand.add(tempRemainingCards[0]);
      tempPlayerHand.add(tempRemainingCards[1]);
      tempDealerHand = state.dealerHand;
    }
    if (toWhom == 'dealer') {
      tempDealerHand.add(tempRemainingCards[0]);
      tempDealerHand.add(tempRemainingCards[1]);
      tempPlayerHand = state.playerHand;
    }
    dealtCards.add(tempRemainingCards[0]);
    double runningCountValueCard1 = _calculateRunningCount(tempRemainingCards[0]);
    double runningCountValueCard2 = _calculateRunningCount(tempRemainingCards[1]);
    tempRemainingCards.removeRange(0, 2);
    double newRunningCount = state.runningCount + runningCountValueCard1 + runningCountValueCard2;

    emit(DeckState(
      deckRepository: state.deckRepository,
      shuffledDeck: state.shuffledDeck,
      cutCardIndex: state.cutCardIndex,
      dealerHand: tempDealerHand,
      playerHand: tempPlayerHand,
      dealtCards: [...state.dealtCards, ...dealtCards],
      trueCount: 0, // Todo set this count for real
      runningCount: newRunningCount,
    ));
  }

  _dealRandomHand() {
    _resetDealerHoleCards();
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
    tempPlayerHand.shuffle(); //* Randomize the the ace location on the screen
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

  _calculateRunningCount(card) {
    double countValue = 0.0;

    if (_hiLoEnabled) {
      countValue = HiloCountGenerator(card.value).fetchCountValue();
    }
    if (_hiOpt1Enabled) {
      countValue = Hiopt1CountGenerator(card.value).fetchCountValue();
    }
    if (_hiOpt2Enabled) {
      countValue = Hiopt2CountGenerator(card.value).fetchCountValue();
    }
    if (_halvesEnabled) {
      countValue = HalvesCountGenerator(card.value).fetchCountValue();
    }
    if (_koEnabled) {
      countValue = KoCountGenerator(card.value).fetchCountValue();
    }
    if (_red7Enabled) {
      countValue = Red7CountGenerator(card.value, card.suit).fetchCountValue();
    }
    if (_zenEnabled) {
      countValue = ZenCountGenerator(card.value).fetchCountValue();
    }
    if (_omegaEnabled) {
      countValue = Omega2CountGenerator(card.value).fetchCountValue();
    }
    if (_thorps10Enabled) {
      countValue = Thorps10CountGenerator(card.value).fetchCountValue();
    }
    if (_acefiveEnabled) {
      countValue = AceFiveCountGenerator(card.value).fetchCountValue();
    }
    if (_kiss1Enabled) {
      countValue = Kiss1CountGenerator(card.value, card.suit, card.name)
          .fetchCountValue();
    }
    if (_kiss2Enabled) {
      countValue = Kiss2CountGenerator(card.value, card.suit).fetchCountValue();
    }
    if (_kiss3Enabled) {
      countValue = Kiss3CountGenerator(card.value, card.suit).fetchCountValue();
    }
    if (_canfieldExpertEnabled) {
      countValue = CanfieldExpertCountGenerator(card.value).fetchCountValue();
    }
    if (_canfieldMasterEnabled) {
      countValue = CanfieldMasterCountGenerator(card.value).fetchCountValue();
    }
    if (_mentorEnabled) {
      countValue = MentorCountGenerator(card.value).fetchCountValue();
    }
    if (_rekoEnabled) {
      countValue = RekoCountGenerator(card.value).fetchCountValue();
    }
    if (_silverFoxEnabled) {
      countValue = SilverFoxCountGenerator(card.value).fetchCountValue();
    }
    if (_ubz2Enabled) {
      countValue = Ubz2CountGenerator(card.value).fetchCountValue();
    }
    if (_revereAdvPlusMinusEnabled) {
      countValue =
          RevereAdvPlusMinusCountGenerator(card.value).fetchCountValue();
    }
    if (_reverePointCountEnabled) {
      countValue = ReverePointCountGenerator(card.value).fetchCountValue();
    }
    if (_revereApcEnabled) {
      countValue = RevereApcCountGenerator(card.value).fetchCountValue();
    }
    if (_revere14Enabled) {
      countValue = Revere14CountGenerator(card.value).fetchCountValue();
    }
    if (_ustonAdvPlusMinusEnabled) {
      countValue =
          UstonAdvPlusMinusCountGenerator(card.value).fetchCountValue();
    }
    if (_ustonApcEnabled) {
      countValue = UstonApcCountGenerator(card.value).fetchCountValue();
    }
    if (_ustonSsEnabled) {
      countValue = UstonSsCountGenerator(card.value).fetchCountValue();
    }

    return countValue;
  }

  void _setStartingCountOffeset() {
    int roundedDeckQuantity = _deckQuantity.round();
    if (_red7Enabled == true) {
      //* Set the Running Count offset required for Red 7 Counts
      if (roundedDeckQuantity == 1) _runningCountOffest = -2.0;
      if (roundedDeckQuantity == 2) _runningCountOffest = -4.0;
      if (roundedDeckQuantity >= 3 && roundedDeckQuantity <= 4) {
        _runningCountOffest = -8.0;
      }
      if (roundedDeckQuantity > 4 && roundedDeckQuantity < 8) {
        _runningCountOffest = -12.0;
      }
      if (roundedDeckQuantity >= 8) _runningCountOffest = -16.0;
    } else if (_rekoEnabled == true) {
      //* Set the Running Count offset required for Reko Counts
      if (roundedDeckQuantity == 1) _runningCountOffest = -1.0;
      if (roundedDeckQuantity == 2) _runningCountOffest = -5.0;
      if (roundedDeckQuantity >= 3 && roundedDeckQuantity <= 7) {
        _runningCountOffest = -20.0;
      }
      if (roundedDeckQuantity > 7) _runningCountOffest = -27.0;
    } else if (_ubz2Enabled == true || _ustonSsEnabled == true) {
      _runningCountOffest = roundedDeckQuantity * -2.0;
    } else {
      _runningCountOffest = 0.0;
    }
  }

  @override
  Future<void> close() {
    basicStrategyStreamSubscription.cancel();
    gameSettingsStreamSubscription.cancel();
    countStreamSubscription.cancel();
    countSettingsStreamSubscription.cancel();
    return super.close();
  }
}
