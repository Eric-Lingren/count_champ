//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft1516Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final double _deckQuantity;

  Soft1516Plays(this._canDoubleAny2, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDoubleAny2) return soft1516MultiDeckDoubleAllowed;
      if (!_canDoubleAny2) return soft1516MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDoubleAny2) return soft1516DoubleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft1516DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (_canDoubleAny2) return soft1516SingleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft1516SingleDeckDoubleNotAllowed;
    }
  }
}

List soft1516MultiDeckDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft1516MultiDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft1516DoubleDeckDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft1516DoubleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft1516SingleDeckDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft1516SingleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 