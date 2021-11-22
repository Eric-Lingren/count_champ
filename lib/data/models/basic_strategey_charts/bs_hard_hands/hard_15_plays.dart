//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Surrender Allowed

class Hard15Plays {
  //* Settings Rules Needed:
  final bool _dealerHitsSoft17;
  final double _deckQuantity;
  final bool _canSurrender;

  Hard15Plays(this._dealerHitsSoft17, this._deckQuantity,
      this._canSurrender);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canSurrender) canSurrender = true;

    if (deckCount >= 4) {
      if (!_dealerHitsSoft17) {
        if (canSurrender) {
          return hard15MultiDeckDealerStandsSurrenderAllowed;
        } // 1
        if (!canSurrender) {
          return hard15MultiDeckDealerStandsSurrenderNotAllowed;
        } // 2
      }
      if (_dealerHitsSoft17) {
        if (canSurrender) return hard15MultiDeckDealerHitsSurrenderAllowed; // 3
        if (!canSurrender) {
          return hard15MultiDeckDealerHitsSurrenderNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (!_dealerHitsSoft17) {
        if (canSurrender) {
          return hard15DoubleDeckDealerStandsSurrenderAllowed;
        } // 5
        if (!canSurrender) {
          return hard15DoubleDeckDealerStandsSurrenderNotAllowed;
        } // 6
      }
      if (_dealerHitsSoft17) {
        if (canSurrender) return hard15DoubleDeckDealerHitsSurrenderAllowed; // 7
        if (!canSurrender) {
          return hard15DoubleDeckDealerHitsSurrenderNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
        if (canSurrender) {
          return hard15SingleDeckDealerStandsSurrenderAllowed;
        } // 9
        if (!canSurrender) {
          return hard15SingleDeckDealerStandsSurrenderNotAllowed;
        } // 10
      }
      if (_dealerHitsSoft17) {
        if (canSurrender)
          return hard15SingleDeckDealerHitsSurrenderAllowed; // 11
        if (!canSurrender) {
          return hard15SingleDeckDealerHitsSurrenderNotAllowed;
        } // 12
      }
    }
  }
}

List hard15MultiDeckDealerStandsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'hit'
];
List hard15MultiDeckDealerStandsSurrenderNotAllowed = [
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
List hard15MultiDeckDealerHitsSurrenderAllowed = [
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
List hard15MultiDeckDealerHitsSurrenderNotAllowed = [
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

List hard15DoubleDeckDealerStandsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'surrender',
  'hit'
];
List hard15DoubleDeckDealerStandsSurrenderNotAllowed = [
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
List hard15DoubleDeckDealerHitsSurrenderAllowed = [
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
List hard15DoubleDeckDealerHitsSurrenderNotAllowed = [
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

List hard15SingleDeckDealerStandsSurrenderAllowed = [
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
List hard15SingleDeckDealerStandsSurrenderNotAllowed = [
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
List hard15SingleDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'hit',
  'hit',
  'surrender'
];
List hard15SingleDeckDealerHitsSurrenderNotAllowed = [
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
