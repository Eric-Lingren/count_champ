class Kiss2CountGenerator {
  final int _cardValue;
  final String _cardSuit;


  Kiss2CountGenerator(this._cardValue, this._cardSuit);

  fetchCountValue() {
    if (_cardValue >= 3 && _cardValue <= 6) return 1.0;
    if (_cardValue == 10) return -1.0;
    if (_cardValue == 2 && (_cardSuit == 'Spades' || _cardSuit == 'Clubs')) {
      return 1.0;
    }
    return 0.0;
  }
}
