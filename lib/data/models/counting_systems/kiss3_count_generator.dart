class Kiss3CountGenerator {
  final int _cardValue;
  final String _cardSuit;


  Kiss3CountGenerator(this._cardValue, this._cardSuit);

  fetchCountValue() {
    if (_cardValue >= 3 && _cardValue <= 7) return 1.0;
    if (_cardValue >= 10 ) return -1.0;
    if (_cardValue == 2 && (_cardSuit == 'Spades' || _cardSuit == 'Clubs')) {
      return 1.0;
    }
    return 0.0;
  }
}
