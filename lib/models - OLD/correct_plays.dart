// Correct Plays - Parent class for some other trainers (phase 1)
// Class
//     Subclasses are:
//         Basic Stratgey
//         Game Play

// ignore_for_file: avoid_print


// import 'package:count_champ/models/settings/game_settings.dart';
// import 'package:count_champ/models/trainers/correct_plays/rules.dart';
// import 'package:count_champ/utils/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class CorrectPlays {
// class CorrectPlays with ChangeNotifier {
class CorrectPlays {
  // var gameSettingsModel = getIt.get<GameSettings>();
  String play = '';
  int dealerTotal = 0;
  num playerTotal = 0;
  bool isPlayCorrect = false;

  // Going to need to account for game settings rules
  checkPlay(String chosenPlay, List playerHand, List dealerHand) {
    dealerTotal = dealerHand[1].value;
    play = chosenPlay;
    bool isHard = false;
    bool isSoft = false;
    bool isPair = false;

    for (var i = 0; i < playerHand.length; i++) {
      if (playerHand.length == 2) {
        if (i == 1) {
          if (playerHand[i].value == playerHand[i - 1].value) {
            isPair = true;
          } else if (playerHand[i].value == 11 ||
              playerHand[i - 1].value == 11) {
            isSoft = true;
          } else {
            isHard = true;
          }
        }
      } else {
        // Add logic here to check for 3+ cards while playing
      }
      playerTotal += playerHand[i].value;
    }

    // var rules = Rules('hard', playerTotal);
    // if (isPair) checkPairHands();
    // if (isSoft) checkSoftHands();
    if (isHard) checkHardHands();
  }

  checkPairHands() {
    print('*** Checking PAIRS ****');
  }

  checkSoftHands() {
    print('*** Checking SOFT ****');
  }

  checkHardHands() {
    print('*** Checking HARD ****');
    checkHard8();
    // if (playerTotal < 9) checkHard8();
  }

  // Always hit unless single deck game
  checkHard8() {
    var rules = [];

    // if (gameSettingsModel.deckQuantity == 1) {
    //   if (gameSettingsModel.canDoubleAny2) {
    //     rules = rulesFor8HardSingleDeckDoubleAllowed;
    //   } else {
    //     rules = rulesFor8HardMultiDeck;
    //   }
    // } else {
    //   rules = rulesFor8HardMultiDeck;
    // }

    // if (rules[dealerTotal - 2] == play) {
    //   print('Nice going!!!');
    // } else {
    //   print('FROWNS');
    // }
  }

  checkHard9() {}
  checkHard10() {}
  checkHard11() {}
  checkHard12() {}
  checkHard13() {}
  checkHard14() {}
  checkHard15() {}
  checkHard16() {}
  checkHard17() {}
  checkHard18() {}

  var rulesFor8HardSingleDeckDoubleAllowed = [
    'hit',
    'hit',
    'hit',
    'double',
    'double',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit'
  ];
  // var rulesFor8SingleDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit'];
  var rulesFor8HardMultiDeck = [
    'hit',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit',
    'hit'
  ];
}
