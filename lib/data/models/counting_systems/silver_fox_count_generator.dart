class SilverFoxCountGenerator {
  final int _cardValue;


  SilverFoxCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue >= 9) return -1.0;
    if (_cardValue <= 7) return 1.0;
    return 0.0;
  }
}
