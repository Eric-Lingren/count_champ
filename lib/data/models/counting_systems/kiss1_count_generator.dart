class Kiss1CountGenerator {
  final int _cardValue;
  final String _cardSuit;
  final String _cardName;


  Kiss1CountGenerator(this._cardValue, this._cardSuit, this._cardName);

  fetchCountValue() {
    if (_cardValue >= 4 && _cardValue <= 6) return 1.0;
    if (_cardName == 'Jack' || _cardName == 'Queen' || _cardName == 'King') return -1.0;
    if (_cardValue == 2 && (_cardSuit == 'Spades' || _cardSuit == 'Clubs')) {
      return 1.0;
    }
    return 0.0;
  }
}
