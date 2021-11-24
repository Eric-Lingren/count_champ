part of 'count_cubit.dart';

class CountState extends Equatable {
  // String chosenPlay;
  bool didDeal;

  // CountState({required this.chosenPlay, this.didDeal = false});
  CountState({this.didDeal = false});

  @override
  List<Object> get props => [didDeal];
  // List<Object> get props => [chosenPlay, didChoosePlay];
}
