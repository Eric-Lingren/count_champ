import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:equatable/equatable.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  bool _isRunningSpeedCount = false;
  final CountSettingsCubit countSettingsCubit;
  late StreamSubscription countSettingsStreamSubscription;

  CountCubit({
    required this.countSettingsCubit,
    countSettingsStreamSubscription,
  }) : super(CountState(didCheckResult: false, wasPlayerCountCorrect: false)){
    _monitorCountSettingsCubit();
  }

  StreamSubscription<CountSettingsState> _monitorCountSettingsCubit() {
    return countSettingsStreamSubscription =
        countSettingsCubit.stream.listen((countSettingsState) {
      resetCheckRunningCount();
    });
  }

  void initNextCard() {
    emit(CountState(
        didDeal: true,
        didCheckResult: state.didCheckResult,
        wasPlayerCountCorrect: state.wasPlayerCountCorrect));
    _triggerNextCardManual();
  }

  void _triggerNextCardManual() {
    emit(CountState(
        didDeal: false,
        didCheckResult: state.didCheckResult,
        wasPlayerCountCorrect: state.wasPlayerCountCorrect));
  }

  void beginSpeedCount(cardsPerSecond) {
    _isRunningSpeedCount = true;
    double milliseconds = 1000 / cardsPerSecond;
    int ms = milliseconds.toInt();
    Timer.periodic(Duration(milliseconds: ms), (Timer timer) {
      if (!_isRunningSpeedCount) {
        timer.cancel();
      } else {
        _initNextCardAuto();
      }
    });
  }

  void _initNextCardAuto() {
    emit(CountState(
        didDeal: true,
        didCheckResult: state.didCheckResult,
        wasPlayerCountCorrect: state.wasPlayerCountCorrect));
    _triggerNextCardAuto();
  }

  void _triggerNextCardAuto() {
    emit(CountState(
        didDeal: false,
        didCheckResult: state.didCheckResult,
        wasPlayerCountCorrect: state.wasPlayerCountCorrect));
  }

  void stopSpeedCount() {
    _isRunningSpeedCount = false;
  }

  void checkRunningCount(submittedText, runningCount) {
    double submittedValue = double.parse(submittedText);
    bool correctCount = submittedValue == runningCount;
    emit(CountState(didCheckResult: true, wasPlayerCountCorrect: correctCount));
  }

  void resetCheckRunningCount() {
    emit(CountState(didCheckResult: false, wasPlayerCountCorrect: false));
  }

  @override
  Future<void> close() {
    countSettingsStreamSubscription.cancel();
    return super.close();
  }
}
