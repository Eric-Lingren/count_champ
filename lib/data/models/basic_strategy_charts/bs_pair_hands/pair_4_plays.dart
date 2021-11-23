//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double After Split Allowed

class Pair4Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final double _deckQuantity;

  Pair4Plays(this._canDas, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDas) return pair4MultiDeckDoubleAllowed;
      if (!_canDas) return pair4MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDas) return pair4DoubleDeckDoubleAllowed; 
      if (!_canDas) return pair4DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDas) return pair4SingleDeckDoubleAllowed; 
      if (!_canDas) return pair4SingleDeckDoubleNotAllowed;
    }
  }
}

List pair4MultiDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair4MultiDeckDoubleNotAllowed = ['hit', 'hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 

List pair4DoubleDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair4DoubleDeckDoubleNotAllowed = ['hit', 'hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 

List pair4SingleDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair4SingleDeckDoubleNotAllowed = ['hit', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 