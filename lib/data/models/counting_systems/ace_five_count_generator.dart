class AceFiveCountGenerator {
  final int _cardValue;


  AceFiveCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 5 ) return 1.0;
    if (_cardValue == 11 ) return -1.0;
    return 0.0;
  }
}
