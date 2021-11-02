import 'package:count_champ/models/person/person.dart';

class Player extends Person {

  Player() : super(1000);

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
