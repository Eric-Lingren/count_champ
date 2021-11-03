import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/person/person.dart';

class Player extends Person {
  // List test = currentPlayerHand;

  Player() : super(1000);

//  showStartingHand() {
//     print('Ran Showing starting hand');
//     print(currentPlayerHand.length);
//     print(currentPlayerHand);
//     // print(test);
//     // test = Deck().currentPlayerHand;
//     // print(test);

//     // List currentPlayerHand = [];
//   }


  // Actions
  double() {
    print('ran double');
  }

  split() {
    print('ran split');
  }

  surrender() {
    print('ran surrender');
  }
}
