//! Rule Variations For This Hand:
//? None - Same Play on all rules

class Pair22Plays {
  final bool _canSplitAces;

  Pair22Plays(this._canSplitAces);

  fetch() {
    if (_canSplitAces) return pair22RulesCanSplitAces;
    if (!_canSplitAces) return pair22RulesCantSplitAces;
  }
}

List pair22RulesCanSplitAces = [
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split',
  'split'
];

List pair22RulesCantSplitAces = [
  'hit',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit',
  'hit'
];
