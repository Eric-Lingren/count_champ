//! Rule Variations For This Hand:
//? 4-8 Deck
//? Double Deck
//? Single Deck
//? Double After Split Allowed

class Pair18Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final bool _dealerHitsSoft17;
  final double _deckQuantity;

  Pair18Plays(this._canDas, this._dealerHitsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 2) return pair18MultiDeck;

    if (deckCount < 2) {
      if (!_dealerHitsSoft17) return pair18MultiDeck;
      if (_dealerHitsSoft17) {
        if(_canDas) return pair18SingleDeckDasAllowed;
        if(!_canDas) return pair18SingleDeckDasNotAllowed;
      }
    }
  }
}

List pair18MultiDeck = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'stand',
  'split',
  'split',
  'stand',
  'stand'
];

List pair18SingleDeckDasAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'stand',
  'split',
  'split',
  'stand',
  'split'
];
List pair18SingleDeckDasNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'stand',
  'split',
  'split',
  'stand',
  'stand'
];