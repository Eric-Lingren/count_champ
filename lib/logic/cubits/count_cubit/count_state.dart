part of 'count_cubit.dart';

class CountState extends Equatable {
  bool didDeal;
  bool didCheckResult;
  bool wasPlayerCountCorrect;

  CountState({this.didDeal = false, required this.didCheckResult, required this.wasPlayerCountCorrect});

  @override
  List<Object> get props => [didDeal, didCheckResult, wasPlayerCountCorrect];
}
