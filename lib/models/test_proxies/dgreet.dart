import 'package:count_champ/models/test_proxies/greet.dart';

class Dgreet {
  Greet _myGreet;
  Dgreet(this._myGreet);
  void doAnotherGreet() {
    _myGreet.doGreet('goodnight');
  }
}