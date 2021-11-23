//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Double Allowed

class Hard11Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerHitsSoft17;
  final double _deckQuantity;

  Hard11Plays(this._canDoubleAny2, this._dealerHitsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    if (deckCount >= 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard11MultiDeckDealerStandsDoubleAllowed; // 1
        if (!_canDoubleAny2) {
          return hard11MultiDeckDealerStandsDoubleNotAllowed;
        } // 2
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard11MultiDeckDealerHitsDoubleAllowed; // 3
        if (!_canDoubleAny2) {
          return hard11MultiDeckDealerHitsDoubleNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard11DoubleDeckDealerStandsDoubleAllowed;
        } // 5
        if (!_canDoubleAny2) {
          return hard11DoubleDeckDealerStandsDoubleNotAllowed;
        } // 6
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard11DoubleDeckDealerHitsDoubleAllowed; // 7
        if (!_canDoubleAny2) {
          return hard11DoubleDeckDealerHitsDoubleNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard11SingleDeckDealerStandsDoubleAllowed;
        } // 9
        if (!_canDoubleAny2) {
          return hard11SingleDeckDealerStandsDoubleNotAllowed;
        } // 10
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard11SingleDeckDealerHitsDoubleAllowed; // 11
        if (!_canDoubleAny2) {
          return hard11SingleDeckDealerHitsDoubleNotAllowed;
        } // 12
      }
    }
  }
}

List hard11MultiDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit']; 
List hard11MultiDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard11MultiDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double']; 
List hard11MultiDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard11DoubleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double']; 
List hard11DoubleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard11DoubleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double']; 
List hard11DoubleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard11SingleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double']; 
List hard11SingleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard11SingleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double']; 
List hard11SingleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 