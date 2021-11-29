//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Double Allowed

class Hard10Plays {
  //* Settings Rules Needed:
  final bool _canDoubleAny2;
  final bool _dealerStandsSoft17;
  final double _deckQuantity;

  Hard10Plays(this._canDoubleAny2, this._dealerStandsSoft17, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    if (deckCount >= 4) {
      if (_dealerStandsSoft17) {
        if (_canDoubleAny2) return hard10MultiDeckDealerStandsDoubleAllowed; // 1
        if (!_canDoubleAny2) {
          return hard10MultiDeckDealerStandsDoubleNotAllowed;
        } // 2
      }
      if (!_dealerStandsSoft17) {
        if (_canDoubleAny2) return hard10MultiDeckDealerHitsDoubleAllowed; // 3
        if (!_canDoubleAny2) {
          return hard10MultiDeckDealerHitsDoubleNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (_dealerStandsSoft17) {
        if (_canDoubleAny2) {
          return hard10DoubleDeckDealerStandsDoubleAllowed;
        } // 5
        if (!_canDoubleAny2) {
          return hard10DoubleDeckDealerStandsDoubleNotAllowed;
        } // 6
      }
      if (!_dealerStandsSoft17) {
        if (_canDoubleAny2) return hard10DoubleDeckDealerHitsDoubleAllowed; // 7
        if (!_canDoubleAny2) {
          return hard10DoubleDeckDealerHitsDoubleNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (_dealerStandsSoft17) {
        if (_canDoubleAny2) {
          return hard10SingleDeckDealerStandsDoubleAllowed;
        } // 9
        if (!_canDoubleAny2) {
          return hard10SingleDeckDealerStandsDoubleNotAllowed;
        } // 10
      }
      if (!_dealerStandsSoft17) {
        if (_canDoubleAny2) return hard10SingleDeckDealerHitsDoubleAllowed; // 11
        if (!_canDoubleAny2) {
          return hard10SingleDeckDealerHitsDoubleNotAllowed;
        } // 12
      }
    }
  }
}

List hard10MultiDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10MultiDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard10MultiDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10MultiDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard10DoubleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10DoubleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard10DoubleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10DoubleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 

List hard10SingleDeckDealerStandsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10SingleDeckDealerStandsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 
List hard10SingleDeckDealerHitsDoubleAllowed = ['double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'hit', 'hit']; 
List hard10SingleDeckDealerHitsDoubleNotAllowed = ['hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit', 'hit']; 