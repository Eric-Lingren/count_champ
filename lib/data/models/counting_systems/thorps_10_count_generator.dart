class Thorps10CountGenerator {
  final int _cardValue;


  Thorps10CountGenerator(this._cardValue);

  fetchCountValue() {
    if (_cardValue < 9 || _cardValue == 11) return 4.0;
    if (_cardValue == 10) return -9.0;
  }
}
