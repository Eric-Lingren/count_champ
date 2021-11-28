class CanfieldExpertCountGenerator {
  final int _cardValue;


  CanfieldExpertCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue >= 3 && _cardValue <= 7) return 1.0;
    if (_cardValue >= 9 && _cardValue <= 10) return -1.0;
    return 0.0;
  }
}
