// Basic Stratgey extends Trainer: (all Phase 1 release unless otherwise noted)
// Page + Class - Subclasses for deviations and other house rules will apply
//     Extends Correct Plays Class and Deck Class
//     All plays are contingent on deck quantity and table rules
//     Practice all hand types:
//         Practice only hards
//         Practice only softs
//         Practice only splits
//         Practice any player hand by value I.E. all 15's or all 9's - Premium Feature
//         Practice against any dealer hand value I.E dealer has 8 or dealer has 17 - Premium Feature
//     Deviation Trainer:   (Phase 2)
//         Premium Feature -  (Phase 2)
//         Deviation Rules: (Phase 2)
//             Contingent upon true count
//             Illustrious 18 (non-insurance plays)
//             Fab 4 (insurance plays)
//     Stats:
//         Show session stats - allow reset
//         Show Career stats - Show Trend over time (later phase)
//     Basic Strategy Charts:
//         Show for all game and rule types.
//         Allow to flip and inverse - Premium Features (later phase)

import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/trainers/correct_plays/correct_plays.dart';
import 'package:flutter/foundation.dart';

class BasicStrategey extends CorrectPlays {
  BasicStrategey();

  // Init Hands
  initNewHand() {
    print('Player init starting hand ran');
    dealStartingHand();
  }

  hit() {
    print('Ran BS Hit');
    checkPlay('hit');
    dealStartingHand();
  }

  stand() {
    print('Ran BS Stand');
    checkPlay('stand');
    dealStartingHand();
  }

  double() {
    print('Ran BS Double');
    checkPlay('double');
    dealStartingHand();
  }

  split() {
    print('Ran BS Split');
    checkPlay('split');
    dealStartingHand();
  }
}
