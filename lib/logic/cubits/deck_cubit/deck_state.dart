part of 'deck_cubit.dart';

class DeckState extends Equatable {
  List deckRepository;
  List dealtCards;
  List dealerHand;
  List playerHand;
  int cutCardIndex;
  List shuffledDeck;

  DeckState({
    required this.deckRepository,
    required this.shuffledDeck,
    required this.dealtCards,
    required this.dealerHand,
    required this.playerHand,
    List? cutCards,
    required this.cutCardIndex});

  @override
  List<Object?> get props => [
    deckRepository, 
    shuffledDeck, 
    dealerHand, 
    playerHand, 
    dealtCards
  ];

}
