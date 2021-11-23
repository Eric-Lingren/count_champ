import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basic_strategy_state.dart';

class BasicStrategyCubit extends Cubit<BasicStrategyState> {

  BasicStrategyCubit() : super(BasicStrategyState());

  void initNextHand() {
    emit(BasicStrategyState(didChoosePlay: true));
    _toggleNewPlay();
  }

  void _toggleNewPlay() {
    emit(BasicStrategyState(didChoosePlay: false));
  }

}
