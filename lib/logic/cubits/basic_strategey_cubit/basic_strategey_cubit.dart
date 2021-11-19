import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/cubit/correct_plays_cubit.dart';
import 'package:equatable/equatable.dart';

part 'basic_strategey_state.dart';

class BasicStrategeyCubit extends Cubit<BasicStrategeyState> {


  BasicStrategeyCubit()
      : super(BasicStrategeyState());
      // : super(BasicStrategeyState(chosenPlay: ''));

  // void choosePlay(chosenPlay) {
  //   print('------ Player Chose ${chosenPlay}');
  //   emit(BasicStrategeyState(chosenPlay: chosenPlay, didChoosePlay: true));
  //   toggleNewPlay();
  // }
  void initNextHand() {
    emit(BasicStrategeyState(didChoosePlay: true));
    toggleNewPlay();
  }

  void toggleNewPlay() {
    emit(BasicStrategeyState(didChoosePlay: false));
  }
  // void toggleNewPlay() {
  //   emit(BasicStrategeyState(
  //       chosenPlay: state.chosenPlay, didChoosePlay: false));
  // }
}
