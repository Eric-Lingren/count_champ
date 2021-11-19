//! Rule Variations For This Hand:
//? 4-8 Deck 
//? Double Deck 
//? Single Deck
//? Double Allowed

class Soft18Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerHitsSoft17;
  final double _deckQuantity;

  Soft18Plays(this._canDoubleAny2, this._dealerHitsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();

    if (deckCount >= 4) {
      if(!_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18MultiDeckDealerStandsDoubleAllowed;
        if (!_canDoubleAny2) return soft18MultiDeckDealerStandsDoubleNotAllowed;
      }
      if(_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18MultiDeckDealerHitsDoubleAllowed;
        if (!_canDoubleAny2) return soft18MultiDeckDealerHitsDoubleNotAllowed;
      }
    }

    if (deckCount >= 2 && deckCount < 4) {
      if(!_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18DoubleDeckDealerStandsDoubleAllowed;
        if (!_canDoubleAny2) return soft18DoubleDeckDealerStandsDoubleNotAllowed;
      }
      if(_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18DoubleDeckDealerHitsDoubleAllowed;
        if (!_canDoubleAny2) return soft18DoubleDeckDealerHitsDoubleNotAllowed;
      }
    }

    if (deckCount < 2) {
      if(!_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18SingleDeckDealerStandsDoubleAllowed;
        if (!_canDoubleAny2) return soft18SingleDeckDealerStandsDoubleNotAllowed;
      }
      if(_dealerHitsSoft17){
        if (_canDoubleAny2) return soft18SingleDeckDealerHitsDoubleAllowed;
        if (!_canDoubleAny2) return soft18SingleDeckDealerHitsDoubleNotAllowed;
      }
    }
  }
}

List soft18MultiDeckDealerStandsDoubleAllowed = ['stand', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18MultiDeckDealerStandsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18MultiDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18MultiDeckDealerHitsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'hit']; 

List soft18DoubleDeckDealerStandsDoubleAllowed = ['stand', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18DoubleDeckDealerStandsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18DoubleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18DoubleDeckDealerHitsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'hit']; 

List soft18SingleDeckDealerStandsDoubleAllowed = ['stand', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'stand']; 
List soft18SingleDeckDealerStandsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'stand']; 
List soft18SingleDeckDealerHitsDoubleAllowed = ['stand', 'double', 'double', 'double', 'double', 'stand', 'stand', 'hit', 'hit', 'hit']; 
List soft18SingleDeckDealerHitsDoubleNotAllowed = ['stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'stand', 'hit', 'hit', 'hit']; 

