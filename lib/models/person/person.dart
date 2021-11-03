import 'package:count_champ/models/card_template.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:flutter/foundation.dart';

class Person extends Deck {
  List hands = [CardTemplate(cardCode: 'as', value: 11, isHoleCard: false)];
  final double bankroll;

  Person(this.bankroll);

  // // Init Hands
  // initStartingHand() {
  //   print('Player init starting hand ran');
  //   dealStartingHand();
  // }
  // showStartingHand() {
  //   print('Ran Showing starting hand');
  //   print(currentPlayerHand.length);
  //   print(test);

  //   // List currentPlayerHand = [];
  // }

  // Actions
  hit() {
    print('ran Hit');
    // Requests new card data from the Deck Model Provider
    var cardDataDealt = dealOneCard();
    // Converts the card data into a Card Template Widget
    var cardTemplateDealt =
        CardTemplate(cardCode: cardDataDealt.code, value: cardDataDealt.value, isHoleCard: cardDataDealt.isHoleCard);
    // Adds the new CardTemplate widget to the players hand
    hands.add(cardTemplateDealt);
    notifyListeners(); // Notifies dependent children the Players hand has new data
  }

  stand() {
    print('ran stand');
  }
}
