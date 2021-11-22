import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/cubit/correct_plays_cubit.dart';
import 'package:equatable/equatable.dart';

part 'basic_strategey_state.dart';

class BasicStrategeyCubit extends Cubit<BasicStrategeyState> {

  BasicStrategeyCubit() : super(BasicStrategeyState());

  void initNextHand() {
    emit(BasicStrategeyState(didChoosePlay: true));
    _toggleNewPlay();
  }

  void _toggleNewPlay() {
    emit(BasicStrategeyState(didChoosePlay: false));
  }

}
