//! Rule Variations For This Hand:
//? 4-8 Deck
//? Double Deck
//? Single Deck
//? Double After Split Allowed

class Pair14Plays {
  //* Settings Rules Needed:
  final bool _canDas;
  final bool _dealerHitsSoft17;
  final bool _canSurrender;
  final double _deckQuantity;

  Pair14Plays(this._canDas, this._dealerHitsSoft17, this._canSurrender, this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canSurrender) canSurrender = true;

    if (deckCount >= 4) {
      return pair14MultiDeck;
    }

    if (deckCount >= 2 && deckCount < 4) {
      if (_canDas) return pair14DoubleDeckDoubleAllowed;
      if (!_canDas) return pair14DoubleDeckDoubleNotAllowed;
    }

    if (deckCount < 2) {
      if (!_dealerHitsSoft17) {
        if (_canDas) {
          if (canSurrender) {
            return pair14SingleDeckDealerStandsDoubleAllowedSurrenderAllowed;
          }
          if (!canSurrender) {
            return pair14SingleDeckDealerStandsDoubleAllowedSurrenderNotAllowed;
          }
        }
        if (!_canDas) {
          if (canSurrender) {
            return pair14SingleDeckDealerStandsDoubleNotAllowedSurrenderAllowed;
          }
          if (!canSurrender) {
            return pair14SingleDeckDealerStandsDoubleNotAllowedSurrenderNotAllowed;
          }
        }
      }
      if (_dealerHitsSoft17) {
        if (_canDas) {
          if (canSurrender) {
            return pair14SingleDeckDealerHitsDoubleAllowedSurrenderAllowed;
          }
          if (!canSurrender) {
            return pair14SingleDeckDealerHitsDoubleAllowedSurrenderNotAllowed;
          }
        }
        if (!_canDas) {
          if (canSurrender) {
            return pair14SingleDeckDealerHitsDoubleNotAllowedSurrenderAllowed;
          }
          if (!canSurrender) {
            return pair14SingleDeckDealerHitsDoubleNotAllowedSurrenderNotAllowed;
          }
        }
      }
    }
  }
}

List pair14MultiDeck = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'hit',
  'hit'
];

List pair14DoubleDeckDoubleAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'hit'
];
List pair14DoubleDeckDoubleNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'hit',
  'hit'
];

List pair14SingleDeckDealerStandsDoubleAllowedSurrenderAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'surrender',
  'hit'
];
List pair14SingleDeckDealerStandsDoubleAllowedSurrenderNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'stand',
  'hit'
];

List pair14SingleDeckDealerStandsDoubleNotAllowedSurrenderAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'surrender',
  'hit'
];
List pair14SingleDeckDealerStandsDoubleNotAllowedSurrenderNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'stand',
  'hit'
];

List pair14SingleDeckDealerHitsDoubleAllowedSurrenderAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'surrender',
  'surrender'
];
List pair14SingleDeckDealerHitsDoubleAllowedSurrenderNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'stand',
  'hit'
];

List pair14SingleDeckDealerHitsDoubleNotAllowedSurrenderAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'surrender',
  'surrender'
];
List pair14SingleDeckDealerHitsDoubleNotAllowedSurrenderNotAllowed = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'hit',
  'hit',
  'stand',
  'hit'
];






