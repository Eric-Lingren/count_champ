//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double After Split Allowed

class Pair6Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final double _deckQuantity;

  Pair6Plays(this._canDas, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDas) return pair6MultiDeckDoubleAllowed;
      if (!_canDas) return pair6MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDas) return pair6DoubleDeckDoubleAllowed; 
      if (!_canDas) return pair6DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDas) return pair6SingleDeckDoubleAllowed; 
      if (!_canDas) return pair6SingleDeckDoubleNotAllowed;
    }
  }
}

List pair6MultiDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair6MultiDeckDoubleNotAllowed = ['hit', 'hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 

List pair6DoubleDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair6DoubleDeckDoubleNotAllowed = ['hit', 'hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 

List pair6SingleDeckDoubleAllowed = ['split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 
List pair6SingleDeckDoubleNotAllowed = ['hit', 'hit', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit', 'hit']; 