class Ubz2CountGenerator {
  final int _cardValue;

  Ubz2CountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 11) return -1.0;
    if (_cardValue == 10) return -2.0;
    if (_cardValue == 2 || _cardValue == 7) return 1.0;
    if (_cardValue >= 3 && _cardValue <= 6) return 2.0;
    return 0.0;
  }
}
