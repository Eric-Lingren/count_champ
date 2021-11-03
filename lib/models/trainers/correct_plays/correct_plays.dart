// Correct Plays - Parent class for some other trainers (phase 1)
// Class
//     Subclasses are:
//         Basic Stratgey
//         Game Play

import 'package:count_champ/models/deck/deck.dart';

class CorrectPlays extends Deck {
  
  checkPlay(chosenPlay) {
    print('Player Chose: ${chosenPlay}');
    num playerTotal = 0;
    for (var i = 0; i < currentPlayerHand.length; i++) {
      print(currentPlayerHand[i].value);
      playerTotal += currentPlayerHand[i].value;
    }
    num dealerUpCard = currentDealerHand[1].value;

    print('Player Total was: ${playerTotal}');
    print('Dealer Upcard was: ${dealerUpCard}');
  }
}
