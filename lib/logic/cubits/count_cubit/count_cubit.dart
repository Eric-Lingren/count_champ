import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  bool _isRunningSpeedCount = false;
  CountCubit() : super(CountState());

  void initNextCard() {
    emit(CountState(didDeal: true));
    _triggerNextCardManual();
  }

  void _triggerNextCardManual() {
    emit(CountState(didDeal: false));
  }

  void beginSpeedCount(cardsPerSecond) {
    _isRunningSpeedCount = true;
    double milliseconds = 1000 / cardsPerSecond;
    int ms = milliseconds.toInt();
    Timer.periodic(Duration(milliseconds: ms), (Timer timer) {
      _initNextCardAuto();
      if (_isRunningSpeedCount == false) timer.cancel();
    });
  }

  void _initNextCardAuto() {
    emit(CountState(didDeal: true));
    _triggerNextCardAuto();
  }

  void _triggerNextCardAuto() {
    emit(CountState(didDeal: false));
  }

  void stopSpeedCount() {
    _isRunningSpeedCount = false;
  }
}
