class DeviationPlays {
  final bool _dealerHitsSoft17;
  final int _trueCount;
  final int _dealerFaceTotal;
  final int _playerTotal;
  final bool _canEarlySurrender;
  final bool _canLateSurrender;
  final bool _canDoubleAny2;
  final double _deckQuantity;

  DeviationPlays(
      this._dealerHitsSoft17,
      this._trueCount,
      this._dealerFaceTotal,
      this._playerTotal,
      this._canEarlySurrender,
      this._canLateSurrender,
      this._canDoubleAny2,
      this._deckQuantity);

  fetch() {
    int deckCount = _deckQuantity.round();
    bool canSurrender = false;
    if (_canEarlySurrender || _canLateSurrender) canSurrender = true;

    if (_dealerFaceTotal == 11) {
      if (deckCount == 1) {
        if (_trueCount > 1) return 'insurance';
      }
      if (deckCount == 2) {
        if (_trueCount > 2) return 'insurance';
      }
      if (deckCount > 2) {
        if (_trueCount > 3) return 'insurance';
      }
    }

    return 'none';

    // if (_playerTotal == 10) {
    //   if (_dealerFaceTotal == 10 || _dealerFaceTotal == 11) {
    //     if (_trueCount >= 4) {
    //       if (_canDoubleAny2) return 'double';
    //       if (!_canDoubleAny2) return 'hit';
    //     } else {
    //       return 'hit';
    //     }
    //   }
    // }

    // if (_playerTotal == 12) {
    //   if (_dealerFaceTotal == 3) {
    //     if (_trueCount >= 2) return 'stand';
    //   }
    //   if (_dealerFaceTotal == 4) {
    //     if (_trueCount <= 3) return 'hit';
    //   }
    //   if (_dealerFaceTotal == 5) {
    //     if (_trueCount <= -2) return 'hit';
    //   }
    //   if (_dealerFaceTotal == 6) {
    //     if (_trueCount <= -1) return 'hit';
    //   }
    // }

    // if (_playerTotal == 13) {
    //   if (_dealerFaceTotal == 2) {
    //     if (_trueCount <= -1) {
    //       return 'hit';
    //     } else {
    //       return 'stand';
    //     }
    //   }
    //   if (_dealerFaceTotal == 3) {
    //     if (_trueCount <= -2) {
    //       return 'hit';
    //     } else {
    //       return 'stand';
    //     }
    //   }
    // }

    // if (_playerTotal == 14) {
    //   if (_dealerFaceTotal == 10) {
    //     if (canSurrender) {
    //       if (_trueCount >= 4) return 'surrender';
    //       if (_trueCount < 4) return 'hit';
    //     }
    //     if (!canSurrender) return 'hit';
    //   }
    // }

    // if (_playerTotal == 15) {
    //   if (_dealerFaceTotal == 9) {
    //     if (_trueCount >= 3) {
    //       if (canSurrender) return 'surrender';
    //       if (!canSurrender) return 'hit';
    //     } else {
    //       return 'hit';
    //     }
    //   }
    //   if (_dealerFaceTotal == 10) {
    //     if (_trueCount >= 0) {
    //       if (canSurrender) return 'surrender';
    //       if (!canSurrender) {
    //         if (_trueCount >= 4) {
    //           return 'stand';
    //         } else {
    //           return 'hit';
    //         }
    //       }
    //     } else {
    //       return 'hit';
    //     }
    //   }
    //   if (_dealerFaceTotal == 11) {
    //     if (_dealerHitsSoft17) {
    //       if (_trueCount >= -1 && canSurrender) {
    //         return 'surrender';
    //       } else {
    //         return 'hit';
    //       }
    //     }
    //     if (!_dealerHitsSoft17) {
    //       if (_trueCount >= 2 && canSurrender) {
    //         return 'surrender';
    //       } else {
    //         return 'hit';
    //       }
    //     }
    //   }
    // }

    // if (_playerTotal == 16) {
    //   if (_dealerFaceTotal == 10) {
    //     if (_trueCount >= 0) {
    //       return 'stand';
    //     } else {
    //       return 'hit';
    //     }
    //   }
    // }

    // if player has 15
    // if dealer has 9
    // if true count is 3
    // return surrender
    // if dealer has 10
    // if true count is 0
    // return surrender
    // if dealer has 11
    // if true count is +2 (in S17) or -1 (in H17)
    // return surrender
  }
}

List deviationRules14SurrenderAllowed = [
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
List deviationRules14SurrenderNotAllowed = [
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

List deviationRules15v9SurrenderAllowedTcAbove = [
  'stand',
  'stand',
  'stand',
  'stand',
  'stand',
  'hit',
  'hit',
  'surrender',
  'surrender',
  'hit'
];
List deviationRules15v9SurrenderAllowedTcBelow = [
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
List deviationRules15v9SurrenderNotAllowed = [
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
