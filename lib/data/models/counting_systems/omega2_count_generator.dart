class Omega2CountGenerator {
  final int _cardValue;


  Omega2CountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 11 || _cardValue == 8) return 0.0;
    if (_cardValue == 2 || _cardValue == 3 || _cardValue == 7) return 1.0;
    if (_cardValue >= 4 && _cardValue <= 6) return 2.0;
    if (_cardValue == 9) return -1.0;
    if (_cardValue == 10) return -2.0;
  }
}
