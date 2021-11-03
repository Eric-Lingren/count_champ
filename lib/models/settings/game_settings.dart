import 'package:flutter/foundation.dart';

// This is the interface for setting game rules.=  
// They are passed down to the Deck via proxy provider
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
  void setDas() {
    canDAS = !canDAS;
    notifyListeners();
  }

  showGameSettingsRule() {
    print('Game RULE RIGHT NOW IS ${canDAS}');
  }
}
