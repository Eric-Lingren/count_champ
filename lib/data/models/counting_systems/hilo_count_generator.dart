class HiloCountGenerator {
  final int _cardValue;


  HiloCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue < 7) return -1.0;
    if (_cardValue >= 7 && _cardValue < 10) return 0.0;
    if (_cardValue >= 10) return 1.0;
  }
}
