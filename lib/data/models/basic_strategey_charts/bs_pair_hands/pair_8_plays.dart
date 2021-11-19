//! Rule Variations For This Hand:
//? 4-8 Deck
//? Double Deck
//? Single Deck
//? Double After Split Allowed

class Pair8Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final bool _canDoubleAny2;
  final double _deckQuantity;

  Pair8Plays(this._canDas, this._canDoubleAny2, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 2) {
      if (_canDas) return pair8MultiDeckDoubleAllowed;
      if (!_canDas) return pair8MultiDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDas) {
        return pair8SingleDeckDoubleAfterSplitAllowed;
      }
      if (!_canDas) {
        if(_canDoubleAny2) return pair8SingleDeckDoubleAny2Allowed;
        if(!_canDoubleAny2) return pair8SingleDeckDoubleNotAllowed;
      }
    }
  }
}

List pair8MultiDeckDoubleAllowed = [
  'hit',
  'hit',
  'hit',
  'split',
  'split',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List pair8MultiDeckDoubleNotAllowed = [
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

List pair8SingleDeckDoubleAfterSplitAllowed = [
  'hit',
  'hit',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List pair8SingleDeckDoubleAny2Allowed = [
  'hit',
  'hit',
  'double',
  'double',
  'double',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List pair8SingleDeckDoubleNotAllowed = [
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
