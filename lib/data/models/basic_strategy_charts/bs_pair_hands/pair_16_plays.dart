//! Rule Variations For This Hand:
//? 4-8 Deck
//? Double Deck
//? Single Deck
//? Double After Split Allowed

class Pair16Plays {
  //* Settings Rules Needed:
  final bool _dealerHitsSoft17;
  final bool _canSurrender;
  final double _deckQuantity;

  Pair16Plays(this._dealerHitsSoft17, this._canSurrender, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canSurrender) canSurrender = true;

    if (deckCount >= 2) {
      if (!canSurrender) return pair16MultiDecksurrenderNotAllowed;
      if (canSurrender) {
        if (!_dealerHitsSoft17) return pair16MultiDecksurrenderNotAllowed;
        if (_dealerHitsSoft17) return pair16MultiDecksurrenderAllowed;
      }
    }

    if (deckCount < 2) return pair16MultiDecksurrenderNotAllowed;
  }
}

List pair16MultiDecksurrenderNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split'
];

List pair16MultiDecksurrenderAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'surrender'
];
