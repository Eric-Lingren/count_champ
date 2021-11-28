class CanfieldMasterCountGenerator {
  final int _cardValue;


  CanfieldMasterCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 2 || _cardValue == 3 || _cardValue == 7) return 1.0;
    if (_cardValue >= 4 && _cardValue <= 6) return 2.0;
    if (_cardValue == 9) return -1.0;
    if (_cardValue == 10) return -2.0;
    return 0.0;
  }
}
