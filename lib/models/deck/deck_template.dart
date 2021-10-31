class Deck {
  final List deckData;
  int deckQuantity = 8;
  List shuffledDeck = [];
  List remainingCards = [];
  List cutCards = [];
  List dealtCards = [];
  double deckPenetration = .70; // range from .1-.95
  int cutCardIndex = 0;

  Deck(this.deckData);

  shuffleDeck() {
    int counter = 0;
    List tempDeck = [];
    while (counter < deckQuantity) {
      var newDeck = deckData;
      newDeck.shuffle();
      tempDeck.add(newDeck);
      counter++;
    }
    var flatTempDeck = tempDeck.expand((i) => i).toList();
    shuffledDeck = flatTempDeck;
    initDealableCards();
  }

  initDealableCards() {
    double availableCardsQuantity = shuffledDeck.length * deckPenetration;
    cutCardIndex = availableCardsQuantity.floor();
    remainingCards = shuffledDeck.sublist(0, cutCardIndex);
    cutCards = shuffledDeck.sublist(cutCardIndex);
  }
}
