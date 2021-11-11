import 'package:count_champ/models/card_template.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:flutter/foundation.dart';

class Person with ChangeNotifier {
// class Person extends Deck {
  // List hands = [CardTemplate(cardCode: 'as', value: 11, isHoleCard: false)];
  // List hand = [];
  String hand = '';
  // final double bankroll;

  void setHand(test) {
    print(test[0].code);
    // hand = test;
    notifyListeners();
  }

  // stand() {
  //   print('ran stand');
  // }
}
