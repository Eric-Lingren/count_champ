import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basic_strategey_state.dart';

class BasicStrategeyCubit extends Cubit<BasicStrategeyState> {
  BasicStrategeyCubit() : super(BasicStrategeyState(chosenPlay: ''));

  void choosePlay(chosenPlay) {
    print('------ Player Chose ${chosenPlay}');
    emit(BasicStrategeyState(chosenPlay: chosenPlay, didChoosePlay: true));
    toggleNewPlay();
  }

  void toggleNewPlay() {
    emit(BasicStrategeyState(
        chosenPlay: state.chosenPlay, didChoosePlay: false));
  }
}
