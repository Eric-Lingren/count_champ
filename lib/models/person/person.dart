import 'package:count_champ/models/card_template.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:flutter/foundation.dart';

class Person extends Deck {
  List hands = [CardTemplate(cardCode: 'as')];
  final double bankroll;

  Person(this.bankroll);

  // Actions
  hit() {
    print('ran Hit');
    var cardDealt = dealOneCard();
    print(dealtCards.length);
    for (var i = 0; i < dealtCards.length; i++) {
      print(dealtCards[i].code);
    }
    print('last card dealt was');
    print(cardDealt.code);
    hands.add(cardDealt);
    print(hands.length);
  }

  stand() {
    print('ran stand');
  }
}
