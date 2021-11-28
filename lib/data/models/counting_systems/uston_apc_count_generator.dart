class UstonApcCountGenerator {
  final int _cardValue;

  UstonApcCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 2 || _cardValue == 8) return 1.0;
    if (_cardValue == 5) return 3.0;
    if (_cardValue >= 3 && _cardValue <= 7) return 2.0;
    if (_cardValue == 9) return -1.0;
    if (_cardValue == 10) return -3.0;
    return 0.0;
  }
}
