part of 'basic_strategey_cubit.dart';

class BasicStrategeyState extends Equatable {
  // String chosenPlay;
  bool didChoosePlay;

  // BasicStrategeyState({required this.chosenPlay, this.didChoosePlay = false});
  BasicStrategeyState({this.didChoosePlay = false});

  @override
  List<Object> get props => [didChoosePlay];
  // List<Object> get props => [chosenPlay, didChoosePlay];
}
