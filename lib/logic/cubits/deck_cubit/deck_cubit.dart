import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/raw_deck_data.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:equatable/equatable.dart';
part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {

  DeckCubit()
      : super(DeckState(
          deckRepository: const [],
          remainingCards: const [],
        )) {
    fetchCardData();
    shuffleDeck();
  }

  StreamController<double> controller = StreamController<double>();

  Future<List> fetchCardData() async {
    List cards =
        rawDeckData.map((data) => CardDataTemplate.fromJson(data)).toList();
    _setCardList(cards);
    return cards;
  }

  void _setCardList(cards) => emit(DeckState(
        deckRepository: cards,
        remainingCards: state.remainingCards,
      ));

  testFunc() {
    print('test func ran');
    dealStartingHand();
  }

  void shuffleDeck() {
    int deckQuantity = 8; // TODO -- Grab this value from settings
    int counter = 0;
    List tempDeck = [];
    while (counter < deckQuantity) {
      var newDeck = state.deckRepository;
      tempDeck.add(newDeck);
      counter++;
    }
    var flatTempDeck = tempDeck.expand((i) => i).toList();
    List shuffledDeck = flatTempDeck;
    shuffledDeck.shuffle();
    _initPlayableCards(shuffledDeck);
  }

  // Sets the max allowable cards that can be dealt out of the deck after shuffle
  // Contingent upon deck quantity and deck penetration (cut card depth).
  _initPlayableCards(shuffledDeck) {
    double deckPenetration =
        0.90; // range from .1-.95 // TODO -- Grab this value from settings
    double availableCardsQuantity = shuffledDeck.length * deckPenetration;
    int cutCardIndex = availableCardsQuantity.floor();
    List remainingCards = shuffledDeck.sublist(0, cutCardIndex);
    List cutCards = shuffledDeck.sublist(cutCardIndex);
    _setPlayableCards(remainingCards, cutCards, cutCardIndex);
  }

  void _setPlayableCards(remainingCards, cutCards, cutCardIndex) =>
      emit(DeckState(
          deckRepository: state.deckRepository,
          remainingCards: remainingCards,
          cutCards: cutCards,
          cutCardIndex: cutCardIndex));

  // Deals 2 cards to each person (dealer and player)
  // First card face up to player
  // Second card face down to dealer
  // Third card face up to player
  // Fourth card face up to dealer
  dealStartingHand() {
    var tempRemainingCards = state.remainingCards;
    print('remaining cards length: ${tempRemainingCards.length}');
    var dealtCards = [];
    var tempDealerHand = [];
    var tempPlayerHand = [];
    for (int i = 0; i < 4; i++) {
      dealtCards.add(tempRemainingCards[i]);
      if (i.isEven) {
        var dealerHoleCard = tempRemainingCards[i];
        if (i == 0) dealerHoleCard.isHoleCard = true;
        tempDealerHand.add(dealerHoleCard);
      }
      if (!i.isEven) tempPlayerHand.add(tempRemainingCards[i]);
    }
    tempRemainingCards.removeRange(0, 4); 
    
    // TODO - Set Dealer Cards in State
    // TODO - Set Player Cards in State
    // TODO - Set Dealt Cards in State
    // TODO - Set Remaining Cards in State
    // _setDealerHand(tempDealerHand);
    // _setPlayerHand(tempPlayerHand);
  }
}
