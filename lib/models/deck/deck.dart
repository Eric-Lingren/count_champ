import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Deck with ChangeNotifier {
  static List deckData = [];
  static List shuffledDeck = [];
  static List remainingCards = [];
  int cutCardIndex = 0;
  List cutCards = [];
  List dealtCards = [];
  // TODO - Extend from GameRules class
  int deckQuantity = 8;
  double deckPenetration = 1.00; // range from .1-.95

  Deck();

  initDeckData() async {
    print('INIT DECK DATA RAN');
    deckData = await readJson();
    print(deckData.length);
    await shuffleDeck();
    await initDealableCards();
  }

  printDeckData() {
    print('remaining Length :');
    print(remainingCards.length);
    // print(remainingCards[0].code);
    // dealtCards.add(remainingCards[0]);
    // remainingCards.removeAt(0);
    print('Dealt Length :');
    print(dealtCards.length);
    // print(dealtCards[0].code);
    // print(remainingCards[0].value);
  }

  shuffleDeck() {
    print('SHUFFLE DECK RAN');
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
  }

  initDealableCards() {
    print('Dealable Cards Ran');
    double availableCardsQuantity = shuffledDeck.length * deckPenetration;
    cutCardIndex = availableCardsQuantity.floor();
    remainingCards = shuffledDeck.sublist(0, cutCardIndex);
    print('remainingCards lenght is');
    print(remainingCards.length);
    cutCards = shuffledDeck.sublist(cutCardIndex);
  }

  dealStartingHand() {
    print('Dealing Starting Cards');
    print('lenght is');
    print(remainingCards.length);
    for (int i = 0; i < 4; i++) {
      dealtCards.add(remainingCards[i]);
    }
    remainingCards.removeRange(0, 4);
    printDeckData();
  }

  dealOneCard() {
    print('DELAING ONE CARD');
    var cardDealt = remainingCards[0];
    dealtCards.add(cardDealt);
    remainingCards.removeAt(0);
    return cardDealt;
  }
}
