//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft19Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerStandsSoft17;
  final double _deckQuantity;

  Soft19Plays(this._canDoubleAny2, this._dealerStandsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 2) {
      if(_dealerStandsSoft17){
        return soft19DealerStands;
      }
      if(!_dealerStandsSoft17){
        if (_canDoubleAny2) return soft19DealerHitsDoubleAllowed;
        if (!_canDoubleAny2) return soft19DealerHitsDoubleNotAllowed;
      }
    }
    
    if (deckCount < 2) {
      if (_canDoubleAny2) return soft19DealerHitsDoubleAllowed;
      if (!_canDoubleAny2) return soft19DealerHitsDoubleNotAllowed;
    }
  }
}

List soft19DealerStands = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand']; 
List soft19DealerHitsDoubleAllowed = ['stand', 'stand', 'stand', 'stand', 'double', 'stand', 'stand', 'stand', 'stand', 'stand']; 
List soft19DealerHitsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand']; 