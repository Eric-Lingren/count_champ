//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft14Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerStandsSoft17;
  final double _deckQuantity;

  Soft14Plays(this._canDoubleAny2, this._dealerStandsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if (_canDoubleAny2) return soft14MultiDeckDoubleAllowed;
      if (!_canDoubleAny2) return soft14MultiDeckDoubleNotAllowed;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if(_dealerStandsSoft17){
        if (_canDoubleAny2) return soft14DoubleDeckDealerStandsDoubleAllowed; 
        if (!_canDoubleAny2) return soft14DoubleDeckDealerStandsDoubleNotAllowed;
      }
      if(!_dealerStandsSoft17){
        if (_canDoubleAny2) return soft14DoubleDeckDealerHitsDoubleAllowed; 
        if (!_canDoubleAny2) return soft14DoubleDeckDealerHitsDoubleNotAllowed;
      }
    }

    if (deckCount < 2) {
      if (_canDoubleAny2) return soft14SingleDeckDoubleAllowed; 
      if (!_canDoubleAny2) return soft14SingleDeckDoubleNotAllowed;
    }
  }
}

List soft14MultiDeckDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft14MultiDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft14DoubleDeckDealerStandsDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft14DoubleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft14DoubleDeckDealerHitsDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft14DoubleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List soft14SingleDeckDoubleAllowed = ['hit', 'hit', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List soft14SingleDeckDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 