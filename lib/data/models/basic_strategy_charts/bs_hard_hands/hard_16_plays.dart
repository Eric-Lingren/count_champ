//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Surrender Allowed

class Hard16Plays {
  //* Settings Rules Needed:
  final bool __dealerStandsSoft17;
  final double _deckQuantity;
  final bool _canSurrender;

  Hard16Plays(this.__dealerStandsSoft17, this._deckQuantity,
      this._canSurrender);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canSurrender) canSurrender = true;

    if (deckCount >= 4) {
      if (__dealerStandsSoft17) {
        if (canSurrender) {
          return hard16MultiDeckDealerStandsSurrenderAllowed;
        } // 1
        if (!canSurrender) {
          return hard16MultiDeckDealerStandsSurrenderNotAllowed;
        } // 2
      }
      if (!__dealerStandsSoft17) {
        if (canSurrender) return hard16MultiDeckDealerHitsSurrenderAllowed; // 3
        if (!canSurrender) {
          return hard16MultiDeckDealerHitsSurrenderNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (__dealerStandsSoft17) {
        if (canSurrender) {
          return hard16DoubleDeckDealerStandsSurrenderAllowed;
        } // 5
        if (!canSurrender) {
          return hard16DoubleDeckDealerStandsSurrenderNotAllowed;
        } // 6
      }
      if (!__dealerStandsSoft17) {
        if (canSurrender) return hard16DoubleDeckDealerHitsSurrenderAllowed; // 7
        if (!canSurrender) {
          return hard16DoubleDeckDealerHitsSurrenderNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (__dealerStandsSoft17) {
        if (canSurrender) {
          return hard16SingleDeckDealerStandsSurrenderAllowed;
        } // 9
        if (!canSurrender) {
          return hard16SingleDeckDealerStandsSurrenderNotAllowed;
        } // 10
      }
      if (!__dealerStandsSoft17) {
        if (canSurrender)
          return hard16SingleDeckDealerHitsSurrenderAllowed; // 11
        if (!canSurrender) {
          return hard16SingleDeckDealerHitsSurrenderNotAllowed;
        } // 12
      }
    }
  }
}

List hard16MultiDeckDealerStandsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'surrender',
  'surrender',
  'surrender'
];
List hard16MultiDeckDealerStandsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List hard16MultiDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'surrender',
  'surrender',
  'surrender'
];
List hard16MultiDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];

List hard16DoubleDeckDealerStandsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'surrender'
];
List hard16DoubleDeckDealerStandsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List hard16DoubleDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'surrender'
];
List hard16DoubleDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];

List hard16SingleDeckDealerStandsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'surrender'
];
List hard16SingleDeckDealerStandsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
List hard16SingleDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'surrender'
];
List hard16SingleDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
