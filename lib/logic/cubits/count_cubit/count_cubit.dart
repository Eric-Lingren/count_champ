import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  bool _isRunningSpeedCount = false;
  CountCubit() : super(CountState(didCheckResult: false, wasPlayerCountCorrect: false));

  void initNextCard() {
    emit(CountState(
      didDeal: true,
      didCheckResult: state.didCheckResult, 
      wasPlayerCountCorrect: state.wasPlayerCountCorrect
      ));
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
      if (!_isRunningSpeedCount){
        timer.cancel();
      } else{
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
}
