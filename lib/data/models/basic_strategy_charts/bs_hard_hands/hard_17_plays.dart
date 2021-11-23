//! Rule Variations For This Hand:
//? 4-8 Deck Dealer Stands Soft 17
//? 4-8 Deck Dealer Hits Soft 17
//? Double Deck Dealer Stands Soft 17
//? Double Deck Dealer Hits Soft 17
//? Single Deck Dealer Stands Soft 17
//? Single Deck Dealer Hits Soft 17
//? Surrender Allowed

class Hard17Plays {
  //* Settings Rules Needed:
  final bool _dealerHitsSoft17;
  final double _deckQuantity;
  final bool _canSurrender;

  Hard17Plays(this._dealerHitsSoft17, this._deckQuantity,
      this._canSurrender);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canSurrender) canSurrender = true;

    if (deckCount >= 4) {
      if (!_dealerHitsSoft17) {
          return hard17MultiDeckDealerStands;
        }
      if (_dealerHitsSoft17) {
        if (canSurrender) return hard17MultiDeckDealerHitsSurrenderAllowed; // 3
        if (!canSurrender) {
          return hard17MultiDeckDealerHitsSurrenderNotAllowed;
        } // 4
      }
    }
    if (deckCount >= 2 && deckCount < 4) {
      if (!_dealerHitsSoft17) {
          return hard17DoubleDeckDealerStands;
        } // 5
      if (_dealerHitsSoft17) {
        if (canSurrender) return hard17DoubleDeckDealerHitsSurrenderAllowed; // 7
        if (!canSurrender) {
          return hard17DoubleDeckDealerHitsSurrenderNotAllowed;
        } // 8
      }
    }
    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
          return hard17SingleDeckDealerStands;
      }
      if (_dealerHitsSoft17) {
        if (canSurrender)
          return hard17SingleDeckDealerHitsSurrenderAllowed; // 11
        if (!canSurrender) {
          return hard17SingleDeckDealerHitsSurrenderNotAllowed;
        } // 12
      }
    }
  }
}

List hard17MultiDeckDealerStands = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];

List hard17MultiDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'surrender'
];
List hard17MultiDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];
List hard17DoubleDeckDealerStands = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];
List hard17DoubleDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'surrender'
];
List hard17DoubleDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];

List hard17SingleDeckDealerStands = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];
List hard17SingleDeckDealerHitsSurrenderAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'surrender'
];
List hard17SingleDeckDealerHitsSurrenderNotAllowed = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'stand'
];
