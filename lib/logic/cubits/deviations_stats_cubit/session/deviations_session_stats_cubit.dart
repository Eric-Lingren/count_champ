import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/deviations_cubit/deviations_cubit.dart';
// import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:equatable/equatable.dart';

part 'deviations_session_stats_state.dart';

class DeviationsSessionStatsCubit extends Cubit<DeviationsSessionStatsState> {
  final DeviationsCubit deviationsCubit;
  late StreamSubscription deviationsStreamSubscription;
  // final CountSettingsCubit countSettingsCubit;
  // late StreamSubscription countSettingsStreamSubscription;
  // String _countingSystem = 'hilo';

  DeviationsSessionStatsCubit({
    required this.deviationsCubit,
    deviationsStreamSubscription,
    // required this.countSettingsCubit,
    // countSettingsStreamSubscription,
  }) : super(DeviationsSessionStatsState(
          streak: 0,
          totalPlayed: 0,
          totalCorrect: 0,
          totalIncorrect: 0,
          illustrious18Played: 0,
          illustrious18Correct: 0,
          illustrious18Incorrect: 0,
          fab4Played: 0,
          fab4Correct: 0,
          fab4Incorrect: 0,
          insurancePlayed: 0,
          insuranceCorrect: 0,
          insuranceIncorrect: 0,
        )) {
    // monitorCountSettingsCubit();
    _monitorDeviationsCubit();
  }

  // StreamSubscription<CountSettingsState> monitorCountSettingsCubit() {
  //   return countSettingsStreamSubscription =
  //       countSettingsCubit.stream.listen((countSettingsState) {
  //     if (countSettingsState.hiLoEnabled == true) _countingSystem = 'hilo';
  //     if (countSettingsState.hiOpt1Enabled == true) _countingSystem = 'hiopt1';
  //     if (countSettingsState.hiOpt2Enabled == true) _countingSystem = 'hiop2';
  //     if (countSettingsState.halvesEnabled == true) _countingSystem = 'halves';
  //     if (countSettingsState.koEnabled == true) _countingSystem = 'ko';
  //     if (countSettingsState.red7Enabled == true) _countingSystem = 'red7';
  //     if (countSettingsState.zenEnabled == true) _countingSystem = 'zen';
  //     if (countSettingsState.omega2Enabled == true) _countingSystem = 'omega2';
  //   });
  // }

  StreamSubscription<DeviationsState> _monitorDeviationsCubit() {
    return deviationsStreamSubscription =
        deviationsCubit.stream.listen((deviationsState) {
      print('\n\n\nDeviations Stream Subscritpion');
      print(deviationsState.wasPlayerCorrect);

      if (deviationsState.wasPlayerCorrect == true) {
        _incrementTotalCorrect();
      } else {
        _incrementTotalIncorrect();
      }
    });
  }

  _incrementTotalCorrect() {
    emit(DeviationsSessionStatsState(
      streak: state.streak + 1,
      totalPlayed: state.totalPlayed + 1,
      totalCorrect: state.totalCorrect + 1,
      totalIncorrect: state.totalIncorrect,
      illustrious18Played: 0,
      illustrious18Correct: 0,
      illustrious18Incorrect: 0,
      fab4Played: 0,
      fab4Correct: 0,
      fab4Incorrect: 0,
      insurancePlayed: 0,
      insuranceCorrect: 0,
      insuranceIncorrect: 0,
    ));
  }

  _incrementTotalIncorrect() {
    emit(DeviationsSessionStatsState(
      streak: 0,
      totalPlayed: state.totalPlayed + 1,
      totalCorrect: state.totalCorrect,
      totalIncorrect: state.totalIncorrect + 1,
      illustrious18Played: 0,
      illustrious18Correct: 0,
      illustrious18Incorrect: 0,
      fab4Played: 0,
      fab4Correct: 0,
      fab4Incorrect: 0,
      insurancePlayed: 0,
      insuranceCorrect: 0,
      insuranceIncorrect: 0,
    ));
  }

  // void _setHiloStats(wasCorrect) {
  //   int correctValue = 0;
  //   int incorrectValue = 0;
  //   if (wasCorrect == true) {
  //     correctValue = 1;
  //   } else {
  //     incorrectValue = 1;
  //   }
  //   emit(RunningCountSessionStatsState(
  //     streak: state.streak,
  //     totalRuns: state.totalRuns,
  //     correctRuns: state.correctRuns,
  //     incorrectRuns: state.incorrectRuns,
  //     hiloPlayed: state.hiloPlayed + 1,
  //     hiloCorrect: state.hiloCorrect + correctValue,
  //     hiloIncorrect: state.hiloIncorrect + incorrectValue,
  //     hiopt1Played: state.hiopt1Played,
  //     hiopt1Correct: state.hiopt1Correct,
  //     hiopt1Incorrect: state.hiopt1Incorrect,
  //     hiopt2Played: state.hiopt2Played,
  //     hiopt2Correct: state.hiopt2Correct,
  //     hiopt2Incorrect: state.hiopt2Incorrect,
  //     halvesPlayed: state.halvesPlayed,
  //     halvesCorrect: state.halvesCorrect,
  //     halvesIncorrect: state.halvesIncorrect,
  //     koPlayed: state.koPlayed,
  //     koCorrect: state.koCorrect,
  //     koIncorrect: state.koIncorrect,
  //     red7Played: state.red7Played,
  //     red7Correct: state.red7Correct,
  //     red7Incorrect: state.red7Incorrect,
  //     zenPlayed: state.zenPlayed,
  //     zenCorrect: state.zenCorrect,
  //     zenIncorrect: state.zenIncorrect,
  //     omega2Played: state.omega2Played,
  //     omega2Correct: state.omega2Correct,
  //     omega2Incorrect: state.omega2Incorrect,
  //   ));
  // }

  @override
  Future<void> close() {
    deviationsStreamSubscription.cancel();
    // countSettingsStreamSubscription.cancel();
    return super.close();
  }
}
