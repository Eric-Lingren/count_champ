//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft17Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final double _deckQuantity;

  Soft17Plays(this._canDoubleAny2, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDoubleAny2) return soft17MultiDeckDoubleAllowed;
      if (!_canDoubleAny2) return soft17MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDoubleAny2) return soft17DoubleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft17DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDoubleAny2) return soft17SingleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft17SingleDeckDoubleNotAllowed;
    }
  }
}

List soft17MultiDeckDoubleAllowed = ['hit', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft17MultiDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft17DoubleDeckDoubleAllowed = ['hit', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft17DoubleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft17SingleDeckDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft17SingleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 