class RevereAdvPlusMinusCountGenerator {
  final int _cardValue;


  RevereAdvPlusMinusCountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue == 9 || _cardValue == 10) return -1.0;
    if (_cardValue <= 6) return 1.0;
    return 0.0;
  }
}
