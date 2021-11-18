import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/raw_deck_data.dart';
import 'package:count_champ/logic/cubits/basic_strategey_cubit.dart/basic_strategey_cubit.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:equatable/equatable.dart';
part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  final BasicStrategeyCubit basicStrategeyCubit;
  late StreamSubscription basicStrategeyStreamSubscription;

  DeckCubit(
      {required this.basicStrategeyCubit, basicStrategeyStreamSubscription})
      : super(DeckState(
          deckRepository: const [],
          shuffledDeck: const [],
          cutCardIndex: 0,
          dealtCards: const [],
          dealerHand: const [],
          playerHand: const [],
        )) {
    fetchCardData();
    shuffleDeck();
    monitorBasicStrategeyCubit();
  }

  StreamSubscription<BasicStrategeyState> monitorBasicStrategeyCubit() {
    dealStartingHand(); //* Deals Cards initially on screen mount
    return basicStrategeyStreamSubscription =
        basicStrategeyCubit.stream.listen((chosenPlay) {
      dealStartingHand(); //* Deals cards again each time a BS button action is chosen.
    });
  }

  // StreamController<double> controller = StreamController<double>();

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
      ));

  testFunc() {
    dealStartingHand();
  }

  void shuffleDeck() {
    int deckQuantity = 1; // TODO -- Grab this value from settings
    int counter = 0;
    List tempDeck = [];
    while (counter < deckQuantity) {
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
    // TODO -- Grab this deck pen value from settings:
    double deckPenetration = 0.80; // * range from .1-.8
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
      ));

  dealStartingHand() {
    // * Deals 2 cards to each person (dealer and player)
    // * First card face up to player, Second card face down to dealer
    // * Third card face up to player, Fourth card face up to dealer

    if (state.dealtCards.length > state.cutCardIndex) shuffleDeck();
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

    emit(DeckState(
        deckRepository: state.deckRepository,
        shuffledDeck: state.shuffledDeck,
        cutCardIndex: state.cutCardIndex,
        dealerHand: tempDealerHand,
        playerHand: tempPlayerHand,
        dealtCards: [...state.dealtCards, ...dealtCards]));
  }

  @override
  Future<void> close() {
    basicStrategeyStreamSubscription.cancel();
    return super.close();
  }
}
