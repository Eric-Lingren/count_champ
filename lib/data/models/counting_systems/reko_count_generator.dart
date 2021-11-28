class RekoCountGenerator {
  final int _cardValue;


  RekoCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue >= 10) return -1.0;
    if (_cardValue <= 7) return 1.0;
    return 0.0;
  }
}
