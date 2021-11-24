class KoCountGenerator {
  final int _cardValue;


  KoCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue <= 7) return 1.0;
    if (_cardValue >= 8 && _cardValue <= 9) return 0.0;
    if (_cardValue >= 10) return -1.0;
  }
}
