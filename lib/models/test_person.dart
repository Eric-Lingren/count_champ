// This class is what Provider will work with.
// It will _provide_ an instance of the class to any widget
// in the tree that cares about it.
import 'package:flutter/foundation.dart';

class TestPerson with ChangeNotifier {
  String name = '';
  int age = 0;

  TestPerson();
  // TestPerson({required this.name, required this.age});

  incrementAge() {
    print(age);
    age +=1;
    print(age);
    notifyListeners();
  }
}
