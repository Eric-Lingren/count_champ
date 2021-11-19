//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft13Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final double _deckQuantity;

  Soft13Plays(this._canDoubleAny2, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDoubleAny2) return soft13MultiDeckDoubleAllowed;
      if (!_canDoubleAny2) return soft13MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDoubleAny2) return soft13DoubleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft13DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDoubleAny2) return soft13SingleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft13SingleDeckDoubleNotAllowed;
    }
  }
}

List soft13MultiDeckDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft13MultiDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft13DoubleDeckDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft13DoubleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft13SingleDeckDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft13SingleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 