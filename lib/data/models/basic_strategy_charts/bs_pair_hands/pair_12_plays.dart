//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double After Split Allowed

class Pair12Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final double _deckQuantity;

  Pair12Plays(this._canDas, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDas) return pair12MultiDeckDoubleAllowed;
      if (!_canDas) return pair12MultiDeckDoubleNotAllowed;
    }

    if (deckCount < 4) {
      if (_canDas) return pair12DoubleDeckDoubleAllowed; 
      if (!_canDas) return pair12DoubleDeckDoubleNotAllowed;
    }
  }
}

List pair12MultiDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List pair12MultiDeckDoubleNotAllowed = ['hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List pair12DoubleDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair12DoubleDeckDoubleNotAllowed = ['split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit', 'hit']; 