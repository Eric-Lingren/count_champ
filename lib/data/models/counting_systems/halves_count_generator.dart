class HalvesCountGenerator {
  final int _cardValue;


  HalvesCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 5) return 1.5;
    if (_cardValue >= 3 && _cardValue <= 6) return 1.0;
    if (_cardValue == 2 || _cardValue == 7) return 0.5;
    if (_cardValue == 8) return 0.0;
    if (_cardValue == 9) return -0.5;
    return -1.0;
  }
}
