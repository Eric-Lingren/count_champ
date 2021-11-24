class Hiopt1CountGenerator {
  final int _cardValue;


  Hiopt1CountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue >= 3 && _cardValue <= 6) return 1.0;
    if (_cardValue == 10) return -1.0;
    return 0.0;
  }
}
