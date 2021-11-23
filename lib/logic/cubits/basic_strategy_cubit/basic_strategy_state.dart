part of 'basic_strategy_cubit.dart';

class BasicStrategyState extends Equatable {
  // String chosenPlay;
  bool didChoosePlay;

  // BasicStrategyState({required this.chosenPlay, this.didChoosePlay = false});
  BasicStrategyState({this.didChoosePlay = false});

  @override
  List<Object> get props => [didChoosePlay];
  // List<Object> get props => [chosenPlay, didChoosePlay];
}
