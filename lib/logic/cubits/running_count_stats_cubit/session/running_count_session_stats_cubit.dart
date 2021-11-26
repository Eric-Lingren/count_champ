import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:equatable/equatable.dart';

part 'running_count_session_stats_state.dart';

class RunningCountSessionStatsCubit
    extends Cubit<RunningCountSessionStatsState> {
  final CountCubit countCubit;
  late StreamSubscription countStreamSubscription;
  final CountSettingsCubit countSettingsCubit;
  late StreamSubscription countSettingsStreamSubscription;
  String _countingSystem = 'hilo';

  RunningCountSessionStatsCubit({
    required this.countCubit,
    countStreamSubscription,
    required this.countSettingsCubit,
    countSettingsStreamSubscription,
  }) : super(RunningCountSessionStatsState(
          streak: 0,
          totalRuns: 0,
          correctRuns: 0,
          incorrectRuns: 0,
          hiloPlayed: 0,
          hiloCorrect: 0,
          hiloIncorrect: 0,
          hiopt1Played: 0,
          hiopt1Correct: 0,
          hiopt1Incorrect: 0,
          hiopt2Played: 0,
          hiopt2Correct: 0,
          hiopt2Incorrect: 0,
          halvesPlayed: 0,
          halvesCorrect: 0,
          halvesIncorrect: 0,
          koPlayed: 0,
          koCorrect: 0,
          koIncorrect: 0,
          red7Played: 0,
          red7Correct: 0,
          red7Incorrect: 0,
          zenPlayed: 0,
          zenCorrect: 0,
          zenIncorrect: 0,
          omega2Played: 0,
          omega2Correct: 0,
          omega2Incorrect: 0,
        )) {
    monitorCountSettingsCubit();
    _monitorCountCubit();
  }

  StreamSubscription<CountSettingsState> monitorCountSettingsCubit() {
    return countSettingsStreamSubscription =
        countSettingsCubit.stream.listen((countSettingsState) {
      if (countSettingsState.hiLoEnabled == true) _countingSystem = 'hilo';
      if (countSettingsState.hiOpt1Enabled == true) _countingSystem = 'hiopt1';
      if (countSettingsState.hiOpt2Enabled == true) _countingSystem = 'hiop2';
      if (countSettingsState.halvesEnabled == true) _countingSystem = 'halves';
      if (countSettingsState.koEnabled == true) _countingSystem = 'ko';
      if (countSettingsState.red7Enabled == true) _countingSystem = 'red7';
      if (countSettingsState.zenEnabled == true) _countingSystem = 'zen';
      if (countSettingsState.omega2Enabled == true) _countingSystem = 'omega2';
    });
  }

  StreamSubscription<CountState> _monitorCountCubit() {
    return countStreamSubscription = countCubit.stream.listen((countState) {
      if (countState.didCheckResult == true) {
        if (countState.wasPlayerCountCorrect == true) {
          _incrementCorrectCount();
        } else {
          _incrementIncorrectCount();
        }

        switch (_countingSystem) {
          case 'hilo':
            return _setHiloStats(countState.wasPlayerCountCorrect);
          case 'hiopt1':
            return _setHiopt1Stats(countState.wasPlayerCountCorrect);
          case 'hiop2':
            return _setHiopt2Stats(countState.wasPlayerCountCorrect);
          case 'halves':
            return _setHalvesStats(countState.wasPlayerCountCorrect);
          case 'ko':
            return _setKoStats(countState.wasPlayerCountCorrect);
          case 'red7':
            return _setRed7Stats(countState.wasPlayerCountCorrect);
          case 'zen':
            return _setZenStats(countState.wasPlayerCountCorrect);
          case 'omega2':
            return _setOmega2Stats(countState.wasPlayerCountCorrect);
          default:
            return null;
        }
      }
    });
  }

  void _incrementCorrectCount() {
    emit(RunningCountSessionStatsState(
      streak: state.streak + 1,
      totalRuns: state.totalRuns + 1,
      correctRuns: state.correctRuns + 1,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _incrementIncorrectCount() {
    emit(RunningCountSessionStatsState(
      streak: 0,
      totalRuns: state.totalRuns + 1,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns + 1,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setHiloStats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed + 1,
      hiloCorrect: state.hiloCorrect + correctValue,
      hiloIncorrect: state.hiloIncorrect + incorrectValue,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setHiopt1Stats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played + 1,
      hiopt1Correct: state.hiopt1Correct + correctValue,
      hiopt1Incorrect: state.hiopt1Incorrect + incorrectValue,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setHiopt2Stats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played + 1,
      hiopt2Correct: state.hiopt2Correct + correctValue,
      hiopt2Incorrect: state.hiopt2Incorrect + incorrectValue,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setHalvesStats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed + 1,
      halvesCorrect: state.halvesCorrect + correctValue,
      halvesIncorrect: state.halvesIncorrect + incorrectValue,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setKoStats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed + 1,
      koCorrect: state.koCorrect + correctValue,
      koIncorrect: state.koIncorrect + incorrectValue,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setRed7Stats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played + 1,
      red7Correct: state.red7Correct + correctValue,
      red7Incorrect: state.red7Incorrect + incorrectValue,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setZenStats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed + 1,
      zenCorrect: state.zenCorrect + correctValue,
      zenIncorrect: state.zenIncorrect + incorrectValue,
      omega2Played: state.omega2Played,
      omega2Correct: state.omega2Correct,
      omega2Incorrect: state.omega2Incorrect,
    ));
  }

  void _setOmega2Stats(wasCorrect) {
    int correctValue = 0;
    int incorrectValue = 0;
    if (wasCorrect == true) {
      correctValue = 1;
    } else {
      incorrectValue = 1;
    }
    emit(RunningCountSessionStatsState(
      streak: state.streak,
      totalRuns: state.totalRuns,
      correctRuns: state.correctRuns,
      incorrectRuns: state.incorrectRuns,
      hiloPlayed: state.hiloPlayed,
      hiloCorrect: state.hiloCorrect,
      hiloIncorrect: state.hiloIncorrect,
      hiopt1Played: state.hiopt1Played,
      hiopt1Correct: state.hiopt1Correct,
      hiopt1Incorrect: state.hiopt1Incorrect,
      hiopt2Played: state.hiopt2Played,
      hiopt2Correct: state.hiopt2Correct,
      hiopt2Incorrect: state.hiopt2Incorrect,
      halvesPlayed: state.halvesPlayed,
      halvesCorrect: state.halvesCorrect,
      halvesIncorrect: state.halvesIncorrect,
      koPlayed: state.koPlayed,
      koCorrect: state.koCorrect,
      koIncorrect: state.koIncorrect,
      red7Played: state.red7Played,
      red7Correct: state.red7Correct,
      red7Incorrect: state.red7Incorrect,
      zenPlayed: state.zenPlayed,
      zenCorrect: state.zenCorrect,
      zenIncorrect: state.zenIncorrect,
      omega2Played: state.omega2Played + 1,
      omega2Correct: state.omega2Correct + correctValue,
      omega2Incorrect: state.omega2Incorrect + incorrectValue,
    ));
  }

  @override
  Future<void> close() {
    countStreamSubscription.cancel();
    countSettingsStreamSubscription.cancel();
    return super.close();
  }
}
