class DeviationPlays {
  final bool _dealerHitsSoft17;
  final int _trueCount;
  final int _dealerFaceTotal;
  final int _playerTotal;
  final bool _canEarlySurrender;
  final bool _canLateSurrender;
  final bool _canDoubleAny2;
  final double _deckQuantity;
  final bool _practiceInsurance;
  final String _handType;

  DeviationPlays(
      this._dealerHitsSoft17,
      this._trueCount,
      this._dealerFaceTotal,
      this._playerTotal,
      this._canEarlySurrender,
      this._canLateSurrender,
      this._canDoubleAny2,
      this._deckQuantity,
      this._practiceInsurance,
      this._handType);

  fetch() {
    int decks = _deckQuantity.round();
    bool canSurrender = false;
    if (_canEarlySurrender || _canLateSurrender) canSurrender = true;

    if (_dealerFaceTotal == 11) {
      if (_practiceInsurance) {
        if (decks < 2) {
          if (_trueCount > 1) return 'insurance';
        }
        if (decks >= 2 && decks < 4) {
          if (_trueCount > 2) return 'insurance';
        }
        if (decks >= 4) {
          if (_trueCount > 3) return 'insurance';
        }
      }
    }

    if (_playerTotal == 15 && canSurrender) {
      if (_dealerFaceTotal == 9 && _trueCount >= 3) return 'surrender';
      if (_dealerFaceTotal == 10 && _trueCount >= 0) return 'surrender';
      if (_dealerFaceTotal == 11){
        if (_dealerHitsSoft17 && _trueCount >= -1) return 'surrender';
        if (!_dealerHitsSoft17 && _trueCount >= 2) return 'surrender';
      }
    }

    if (_playerTotal == 14 && canSurrender) {
      if (_dealerFaceTotal == 10 && _trueCount >= 4) return 'surrender';
    }

    if (_playerTotal == 16 && _dealerFaceTotal == 10) {
      if (_trueCount >= 0) return 'stand';
    }

    if (_playerTotal == 15 && _dealerFaceTotal == 10) {
      if (_trueCount >= 4) return 'stand';
    }

    if (_playerTotal == 20 && _handType == 'pair') {
      if (_dealerFaceTotal == 5) {
        if (_trueCount >= 5) return 'split';
      }
      if (_dealerFaceTotal == 6) {
        if (decks < 2) {
          if (_trueCount >= 4) return 'split';
        }
        if (decks >= 2 && decks > 4) {
          if (_dealerHitsSoft17 && _trueCount >= 4) return 'split';
          if (!_dealerHitsSoft17 && _trueCount >= 5) return 'split';
        }
        if (decks >= 4) {
          if (_trueCount >= 4) return 'split';
        }
      }
    }

    if (_playerTotal == 10 && _dealerFaceTotal == 10) {
      if (decks < 2 && _trueCount >= 3) return 'double';
      if (decks >= 2 && _trueCount >= 4) return 'double';
    }

    if (_playerTotal == 12 && _dealerFaceTotal == 3) {
      if (decks < 4 && _trueCount >= 3) return 'stand';
      if (decks >= 4 && _trueCount >= 2) return 'stand';
    }

    if (_playerTotal == 12 && _dealerFaceTotal == 2) {
      if (_trueCount >= 4) return 'stand';
    }

    if (_playerTotal == 11 && _dealerFaceTotal == 11) {
      if (decks < 2) {
        if (!_dealerHitsSoft17 && _trueCount >= -1) return 'double';
        if (_dealerHitsSoft17 && _trueCount >= -2) return 'double';
      }
      if (decks >= 2 && decks < 4) {
        if (!_dealerHitsSoft17 && _trueCount >= 0) return 'double';
        if (_dealerHitsSoft17 && _trueCount >= -1) return 'double';
      }
      if (decks >= 4) {
        if (!_dealerHitsSoft17 && _trueCount >= 1) return 'double';
        if (_dealerHitsSoft17 && _trueCount >= 0) return 'double';
      }
    }

    if (_playerTotal == 9 && _dealerFaceTotal == 2) {
      if (_trueCount >= 1) return 'double';
    }

    if (_playerTotal == 10 && _dealerFaceTotal == 11) {
      if (decks < 2) {
        if (_trueCount >= 2) return 'double';
      }
      if (decks >= 2 && decks < 4) {
        if (_trueCount >= 3) return 'double';
      }
      if (decks >= 4) {
        if (!_dealerHitsSoft17 && _trueCount >= 4) return 'double';
        if (_dealerHitsSoft17 && _trueCount >= 3) return 'double';
      }
    }

    if (_playerTotal == 9 && _dealerFaceTotal == 7) {
      if (_trueCount >= 4) return 'double';
    }

    if (_playerTotal == 16 && _dealerFaceTotal == 9) {
      if (_trueCount >= 5) return 'stand';
    }

    if (_playerTotal == 13 && _dealerFaceTotal == 2) {
      if (_trueCount <= 0) return 'hit';
    }

    if (_playerTotal == 12 && _dealerFaceTotal == 4) {
      if (decks < 2 && _trueCount <= 1) return 'hit';
      if (decks >= 2 && _trueCount <= 0) return 'hit';
    }

    if (_playerTotal == 12 && _dealerFaceTotal == 5) {
      if (decks < 2 && _trueCount <= 0) return 'hit';
      if (decks >= 2 && _trueCount <= -1) return 'hit';
    }

    if (_playerTotal == 12 && _dealerFaceTotal == 6) {
      if (decks < 2) {
        if (!_dealerHitsSoft17 && _trueCount <= 1) return 'hit';
        if (_dealerHitsSoft17 && _trueCount <= -2) return 'hit';
      }
      if (decks >= 2 && decks < 4) {
        if (!_dealerHitsSoft17 && _trueCount <= 0) return 'hit';
        if (_dealerHitsSoft17 && _trueCount <= -3) return 'hit';
      }
      if (decks >= 4) {
        if (!_dealerHitsSoft17 && _trueCount <= -1) return 'hit';
        if (_dealerHitsSoft17 && _trueCount <= -3) return 'hit';
      }
    }

    if (_playerTotal == 13 && _dealerFaceTotal == 3) {
      if (decks < 2 && _trueCount <= -1) return 'hit';
      if (decks >= 2 && _trueCount <= -2) return 'hit';
    }

    return 'none';
  }
}
