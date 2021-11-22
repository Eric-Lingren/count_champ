class InsurancePlays {
  final int _trueCount;
  final int _dealerFaceTotal;
  final double _deckQuantity;
  final bool _practiceInsurance;

  InsurancePlays(
      this._trueCount,
      this._dealerFaceTotal,
      this._deckQuantity,
      this._practiceInsurance);

  fetch() {
    int decks = _deckQuantity.round();
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
    return 'none';
  }
}
