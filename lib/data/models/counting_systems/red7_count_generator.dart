class Red7CountGenerator {
  final int _cardValue;
  final String _cardSuit;

  Red7CountGenerator(this._cardValue, this._cardSuit);

  fetchCountValue() {
    if (_cardValue >= 10) return -1.0;
    if (_cardValue >= 2 && _cardValue <= 6) return 1.0;
    if (_cardValue == 7 && (_cardSuit == 'Diamonds' || _cardSuit == 'Hearts')) {
      return 1.0;
    }
    return 0.0;
  }
}
