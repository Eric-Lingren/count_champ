//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Double Allowed

class Hard8Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerHitsSoft17;
  final double _deckQuantity;

  Hard8Plays(this._canDoubleAny2, this._dealerHitsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    if (deckCount >= 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard8MultiDeckDealerStandsDoubleAllowed; // 1
        if (!_canDoubleAny2) {
          return hard8MultiDeckDealerStandsDoubleNotAllowed;
        } // 2
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard8MultiDeckDealerHitsDoubleAllowed; // 3
        if (!_canDoubleAny2) {
          return hard8MultiDeckDealerHitsDoubleNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard8DoubleDeckDealerStandsDoubleAllowed;
        } // 5
        if (!_canDoubleAny2) {
          return hard8DoubleDeckDealerStandsDoubleNotAllowed;
        } // 6
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard8DoubleDeckDealerHitsDoubleAllowed; // 7
        if (!_canDoubleAny2) {
          return hard8DoubleDeckDealerHitsDoubleNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
        if (_canDoubleAny2) {
          return hard8SingleDeckDealerStandsDoubleAllowed;
        } // 9
        if (!_canDoubleAny2) {
          return hard8SingleDeckDealerStandsDoubleNotAllowed;
        } // 10
      }
      if (_dealerHitsSoft17) {
        if (_canDoubleAny2) return hard8SingleDeckDealerHitsDoubleAllowed; // 11
        if (!_canDoubleAny2) {
          return hard8SingleDeckDealerHitsDoubleNotAllowed;
        } // 12
      }
    }
  }
}

List hard8MultiDeckDealerStandsDoubleAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8MultiDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8MultiDeckDealerHitsDoubleAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8MultiDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard8DoubleDeckDealerStandsDoubleAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8DoubleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8DoubleDeckDealerHitsDoubleAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8DoubleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard8SingleDeckDealerStandsDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8SingleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8SingleDeckDealerHitsDoubleAllowed = ['hit', 'hit', 'hit', 'double', 'double', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard8SingleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 