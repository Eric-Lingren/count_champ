import 'package:count_champ/models/person/player.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:count_champ/utils/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Class maintains the raw deck data and deck behaviors

class Deck with ChangeNotifier {
  var gameSettingsModel = getIt.get<GameSettings>();

  static List deckData = [];
  static List shuffledDeck = [];
  static List remainingCards = [];
  int cutCardIndex = 0;
  List cutCards = [];
  List dealtCards = [];
  List currentDealerHand = [];
  List currentPlayerHand = [];
  // TODO - Extend from GameRules class
  int deckQuantity = 8;
  double deckPenetration = 1.00; // range from .1-.95

  // init deck function is to get all deck data from json.
  // Only needs to run once on mount.
  // Once the data is loaded via a trainer we can simply shuffle and init dealable cards over and over.
  initDeckData() async {
    deckData = await readJson();
    await shuffleDeck();
    await initDealableCards();
  }

  showDeckRule() {
    gameSettingsModel.showGameSettingsRule();
  }
  setDeckRule() {
    gameSettingsModel.setDas();
  }

  // Random func for checking state of the deck.  Modify as you need.
  printDeckData() {
    print('dealer first card is');
    print(currentDealerHand[0].code);
    print('dealer second card is');
    print(currentDealerHand[1].code);
    print('Player first card is');
    print(currentPlayerHand[0].code);
    print('Player second card is');
    print(currentPlayerHand[1].code);
  }

  // Reorders and resets all the card data
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
  }

  // Sets the max allowable cards that can be dealt out of the deck after shuffle
  // Contingent upon deck quantity and deck penetration (cut card depth).
  initDealableCards() {
    print('Dealable Cards Ran');
    double availableCardsQuantity = shuffledDeck.length * deckPenetration;
    cutCardIndex = availableCardsQuantity.floor();
    remainingCards = shuffledDeck.sublist(0, cutCardIndex);
    cutCards = shuffledDeck.sublist(cutCardIndex);
  }

  // Deals 2 cards to each person (dealer and player)
  // First card face up to player
  // Second card face down to dealer
  // Third card face up to player
  // Fourth card face up to dealer
  dealStartingHand() {
    print('Dealing Starting Cards');
    var tempDealerHand = [];
    var tempPlayerHand = [];
    for (int i = 0; i < 4; i++) {
      dealtCards.add(remainingCards[i]);
      if (i.isEven) {
        var dealerHoleCard = remainingCards[i];
        if (i == 0) dealerHoleCard.isHoleCard = true;
        tempDealerHand.add(dealerHoleCard);
      }
      if (!i.isEven) tempPlayerHand.add(remainingCards[i]);
    }
    remainingCards.removeRange(0, 4);
    _setDealerHand(tempDealerHand);
    _setPlayerHand(tempPlayerHand);
  }

  _setDealerHand(hand) {
    currentDealerHand = hand;
    notifyListeners();
  }

  _setPlayerHand(hand) {
    currentPlayerHand = hand;
    notifyListeners();
  }

  // Deals one card to the requested person (dealer or player depending on who called it)
  dealOneCard() {
    print('DELAING ONE CARD');
    var cardDealt = remainingCards[0];
    dealtCards.add(cardDealt);
    remainingCards.removeAt(0);
    return cardDealt; // This is the CardDataTemplate.  Need to convert to a CardTemplate widget to render
  }
}
