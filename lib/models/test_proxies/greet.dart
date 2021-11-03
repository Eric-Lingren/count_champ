import 'package:flutter/foundation.dart';

class Greet with ChangeNotifier {
  String greetings = 'good morning';
  void doGreet(String value) {
    greetings = value;
    notifyListeners();
  }
}