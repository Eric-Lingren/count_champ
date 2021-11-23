import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'basic_strategy_alltime_stats_state.dart';

class BasicStrategyAlltimeStatsCubit
    extends HydratedCubit<BasicStrategyAlltimeStatsState> {
  final CorrectPlaysCubit correctPlaysCubit;
  late StreamSubscription correctPlaysStreamSubscription;
  int _hardHandsPlayed = 0;
  int _hardHandsCorrect = 0;
  int _hardHandsIncorrect = 0;
  int _softHandsPlayed = 0;
  int _softHandsCorrect = 0;
  int _softHandsIncorrect = 0;
  int _pairHandsPlayed = 0;
  int _pairHandsCorrect = 0;
  int _pairHandsIncorrect = 0;

  int _illustrious18HandsPlayed = 0;
  int _illustrious18HandsCorrect = 0;
  int _illustrious18HandsIncorrect = 0;
  int _fab4HandsPlayed = 0;
  int _fab4HandsCorrect = 0;
  int _fab4HandsIncorrect = 0;
  int _insuranceHandsPlayed = 0;
  int _insuranceHandsCorrect = 0;
  int _insuranceHandsIncorrect = 0;

  BasicStrategyAlltimeStatsCubit({
    required this.correctPlaysCubit,
    correctPlaysStreamSubscription,
  }) : super(BasicStrategyAlltimeStatsState(
          currentStreak: 0,
          handsPlayed: 0,
          correctHandsPlayed: 0,
          incorrectHandsPlayed: 0,
          hardHandsPlayed: 0,
          hardHandsCorrect: 0,
          hardHandsIncorrect: 0,
          softHandsPlayed: 0,
          softHandsCorrect: 0,
          softHandsIncorrect: 0,
          pairHandsPlayed: 0,
          pairHandsCorrect: 0,
          pairHandsIncorrect: 0,
          illustrious18HandsPlayed: 0,
          illustrious18HandsCorrect: 0,
          illustrious18HandsIncorrect: 0,
          fab4HandsPlayed: 0,
          fab4HandsCorrect: 0,
          fab4HandsIncorrect: 0,
          insuranceHandsPlayed: 0,
          insuranceHandsCorrect: 0,
          insuranceHandsIncorrect: 0,
        )) {
    _monitorDeckCubit();
  }

  StreamSubscription<CorrectPlaysState> _monitorDeckCubit() {
    return correctPlaysStreamSubscription =
        correctPlaysCubit.stream.listen((correctPlaysState) {
      if (correctPlaysState.handType == 'hard')
        _incrementHardHandPlayed(correctPlaysState.playWasCorrect);
      if (correctPlaysState.handType == 'soft')
        _incrementSoftHandPlayed(correctPlaysState.playWasCorrect);
      if (correctPlaysState.handType == 'pair')
        _incrementPairHandPlayed(correctPlaysState.playWasCorrect);
      if (correctPlaysState.handType == 'illustrious18')
        _incrementIllustrious18HandPlayed(correctPlaysState.playWasCorrect);
      if (correctPlaysState.handType == 'fab4')
        _incrementFab4HandPlayed(correctPlaysState.playWasCorrect);
      if (correctPlaysState.handType == 'insurance')
        _incrementInsuranceHandPlayed(correctPlaysState.playWasCorrect);
    });
  }

  void _incrementCorrectHandPlayed() {
    emit(BasicStrategyAlltimeStatsState(
      currentStreak: state.currentStreak + 1,
      handsPlayed: state.handsPlayed + 1,
      correctHandsPlayed: state.correctHandsPlayed + 1,
      incorrectHandsPlayed: state.incorrectHandsPlayed,
      hardHandsPlayed: _hardHandsPlayed,
      hardHandsCorrect: _hardHandsCorrect,
      hardHandsIncorrect: _hardHandsIncorrect,
      softHandsPlayed: _softHandsPlayed,
      softHandsCorrect: _softHandsCorrect,
      softHandsIncorrect: _softHandsIncorrect,
      pairHandsPlayed: _pairHandsPlayed,
      pairHandsCorrect: _pairHandsCorrect,
      pairHandsIncorrect: _pairHandsIncorrect,
      illustrious18HandsPlayed: _illustrious18HandsPlayed,
      illustrious18HandsCorrect: _illustrious18HandsCorrect,
      illustrious18HandsIncorrect: _illustrious18HandsIncorrect,
      fab4HandsPlayed: _fab4HandsPlayed,
      fab4HandsCorrect: _fab4HandsCorrect,
      fab4HandsIncorrect: _fab4HandsIncorrect,
      insuranceHandsPlayed: _insuranceHandsPlayed,
      insuranceHandsCorrect: _insuranceHandsCorrect,
      insuranceHandsIncorrect: _insuranceHandsIncorrect,
    ));
  }

  void _incrementIncorrectHandPlayed() {
    emit(BasicStrategyAlltimeStatsState(
      currentStreak: 0,
      handsPlayed: state.handsPlayed + 1,
      correctHandsPlayed: state.correctHandsPlayed,
      incorrectHandsPlayed: state.incorrectHandsPlayed + 1,
      hardHandsPlayed: _hardHandsPlayed,
      hardHandsCorrect: _hardHandsCorrect,
      hardHandsIncorrect: _hardHandsIncorrect,
      softHandsPlayed: _softHandsPlayed,
      softHandsCorrect: _softHandsCorrect,
      softHandsIncorrect: _softHandsIncorrect,
      pairHandsPlayed: _pairHandsPlayed,
      pairHandsCorrect: _pairHandsCorrect,
      pairHandsIncorrect: _pairHandsIncorrect,
      illustrious18HandsPlayed: _illustrious18HandsPlayed,
      illustrious18HandsCorrect: _illustrious18HandsCorrect,
      illustrious18HandsIncorrect: _illustrious18HandsIncorrect,
      fab4HandsPlayed: _fab4HandsPlayed,
      fab4HandsCorrect: _fab4HandsCorrect,
      fab4HandsIncorrect: _fab4HandsIncorrect,
      insuranceHandsPlayed: _insuranceHandsPlayed,
      insuranceHandsCorrect: _insuranceHandsCorrect,
      insuranceHandsIncorrect: _insuranceHandsIncorrect,
    ));
  }

  void _incrementHardHandPlayed(playWasCorrect) {
    _hardHandsPlayed = _hardHandsPlayed + 1;
    if (playWasCorrect == true) {
      _hardHandsCorrect = _hardHandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _hardHandsIncorrect = _hardHandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void _incrementSoftHandPlayed(playWasCorrect) {
    _softHandsPlayed = _softHandsPlayed + 1;
    if (playWasCorrect == true) {
      _softHandsCorrect = _softHandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _softHandsIncorrect = _softHandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void _incrementPairHandPlayed(playWasCorrect) {
    _pairHandsPlayed = _pairHandsPlayed + 1;
    if (playWasCorrect == true) {
      _pairHandsCorrect = _pairHandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _pairHandsIncorrect = _pairHandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void _incrementIllustrious18HandPlayed(playWasCorrect) {
    _illustrious18HandsPlayed = _illustrious18HandsPlayed + 1;
    if (playWasCorrect == true) {
      _illustrious18HandsCorrect = _illustrious18HandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _illustrious18HandsIncorrect = _illustrious18HandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void _incrementFab4HandPlayed(playWasCorrect) {
    _fab4HandsPlayed = _fab4HandsPlayed + 1;
    if (playWasCorrect == true) {
      _fab4HandsCorrect = _fab4HandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _fab4HandsIncorrect = _fab4HandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void _incrementInsuranceHandPlayed(playWasCorrect) {
    _insuranceHandsPlayed = _insuranceHandsPlayed + 1;
    if (playWasCorrect == true) {
      _insuranceHandsCorrect = _insuranceHandsCorrect + 1;
      _incrementCorrectHandPlayed();
    }
    if (playWasCorrect == false) {
      _insuranceHandsIncorrect = _insuranceHandsIncorrect + 1;
      _incrementIncorrectHandPlayed();
    }
  }

  void clearAlltimeStats() { // TODO - Connect this function to an ad play
    emit(BasicStrategyAlltimeStatsState(
      currentStreak: 0,
      handsPlayed: 0,
      correctHandsPlayed: 0,
      incorrectHandsPlayed: 0,
      hardHandsPlayed: 0,
      hardHandsCorrect: 0,
      hardHandsIncorrect: 0,
      softHandsPlayed: 0,
      softHandsCorrect: 0,
      softHandsIncorrect: 0,
      pairHandsPlayed: 0,
      pairHandsCorrect: 0,
      pairHandsIncorrect: 0,
      illustrious18HandsPlayed: 0,
      illustrious18HandsCorrect: 0,
      illustrious18HandsIncorrect: 0,
      fab4HandsPlayed: 0,
      fab4HandsCorrect: 0,
      fab4HandsIncorrect: 0,
      insuranceHandsPlayed: 0,
      insuranceHandsCorrect: 0,
      insuranceHandsIncorrect: 0,
    ));
  }



  @override
  BasicStrategyAlltimeStatsState? fromJson(Map<String, dynamic> json) {
    return BasicStrategyAlltimeStatsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BasicStrategyAlltimeStatsState state) {
    return state.toMap();
  }
}
