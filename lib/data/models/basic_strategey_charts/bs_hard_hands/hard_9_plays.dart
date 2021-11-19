//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Double Allowed

class Hard9Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerHitsSoft17;
  final double _deckQuantity;

  Hard9Plays(this._canDoubleAny2, this._dealerHitsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    if (deckCount >= 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard9MultiDeckDealerStandsDoubleAllowed; // 1
        if (!_canDoubleAny2) {
          return hard9MultiDeckDealerStandsDoubleNotAllowed;
        } // 2
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard9MultiDeckDealerHitsDoubleAllowed; // 3
        if (!_canDoubleAny2) {
          return hard9MultiDeckDealerHitsDoubleNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard9DoubleDeckDealerStandsDoubleAllowed;
        } // 5
        if (!_canDoubleAny2) {
          return hard9DoubleDeckDealerStandsDoubleNotAllowed;
        } // 6
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard9DoubleDeckDealerHitsDoubleAllowed; // 7
        if (!_canDoubleAny2) {
          return hard9DoubleDeckDealerHitsDoubleNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard9SingleDeckDealerStandsDoubleAllowed;
        } // 9
        if (!_canDoubleAny2) {
          return hard9SingleDeckDealerStandsDoubleNotAllowed;
        } // 10
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard9SingleDeckDealerHitsDoubleAllowed; // 11
        if (!_canDoubleAny2) {
          return hard9SingleDeckDealerHitsDoubleNotAllowed;
        } // 12
      }
    }
  }
}

List hard9MultiDeckDealerStandsDoubleAllowed = ['hit', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9MultiDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9MultiDeckDealerHitsDoubleAllowed = ['hit', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9MultiDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard9DoubleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9DoubleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9DoubleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9DoubleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard9SingleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9SingleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9SingleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard9SingleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 