import 'package:flutter/foundation.dart';

// Is the Proxy - AKA JOB
// WE want to interface with this

class GameSettings with ChangeNotifier {
  bool canDAS = true;
  bool canDoubleAny2 = true; // False = reno rules - double only on 9-11 hard
  bool canResplit = true;
  bool canSplitAces = true;
  bool canHitAfterSplitAces = true;
  bool dealerHitsSoft17 = false;
  bool canEarlySurrender = false;
  bool canLateSurrender = true;
  bool isNoPeek = false;
  int deckQuantity = 8;
  double deckPenetration = 1.00;

  // GameSettings();

  setDas() {
    print('ran set das');
    canDAS = !canDAS;
    print(canDAS);
    notifyListeners();
    print('done das');
  }

  showGameSettingsRule() {
    print('Game RULE RIGHT NOW IS ${canDAS}');
  }
}
