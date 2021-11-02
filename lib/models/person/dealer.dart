import 'package:count_champ/models/person/person.dart';

class Dealer extends Person {
  Dealer() : super(0.0) ;

  // Actions
  checkHoleCard() {
    print('checking hole card');
  }
}
