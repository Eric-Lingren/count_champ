class Person {
  final List hands = [];
  final double bankroll;

  Person(this.bankroll);

  // Actions
  hit() {
    print('ran Hit');
  }

  stand() {
    print('ran stand');
  }
}
