class Deck {
  final List deckData;
  List shuffledDeck = [];
  List remainingCards = [];
  List cutCards = [];
  List dealtCards = [];
  // TODO - Extend from GameRules class
  int deckQuantity = 8;
  double deckPenetration = 1.00; // range from .1-.95


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
    int cutCardIndex = availableCardsQuantity.floor();
    remainingCards = shuffledDeck.sublist(0, cutCardIndex);
    cutCards = shuffledDeck.sublist(cutCardIndex);
  }
}
