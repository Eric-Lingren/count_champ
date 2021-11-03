// Correct Plays - Parent class for some other trainers (phase 1)
// Class
//     Subclasses are:
//         Basic Stratgey
//         Game Play

// ignore_for_file: avoid_print

import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class CorrectPlays {
// class CorrectPlays with ChangeNotifier {
class CorrectPlays {



  // Going to need to account for game settings rules
  checkPlay(chosenPlay) {
    print('Player Chose: ${chosenPlay}');
    // showDasSeting();
    // num playerTotal = 0;
    // for (var i = 0; i < currentPlayerHand.length; i++) {
    //   print(currentPlayerHand[i].value);
    //   playerTotal += currentPlayerHand[i].value;
    // }
    // num dealerUpCard = currentDealerHand[1].value;

    // print('Player Total was: ${playerTotal}');
    // print('Dealer Upcard was: ${dealerUpCard}');
    // checkSettings();
  }
}
