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
  var _previousHand;

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
          deviationsStatsMatrix: [
            ['', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'A'], // Dealer
            [
              '20',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '19',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '18',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '17',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '16',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '15',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '14',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '13',
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '12',
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
            [
              '11',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
            ],
            [
              '10',
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
            ],
            [
              '9',
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': 0},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
              {'played': 0.0, 'correct': 0.0, 'percentage': null},
            ],
          ],
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
  //   });
  // }

  StreamSubscription<DeviationsState> _monitorDeviationsCubit() {
    return deviationsStreamSubscription =
        deviationsCubit.stream.listen((deviationsState) {
      if (deviationsState.wasPlayerCorrect == true) {
        _incrementTotalCorrect();
      } else {
        _incrementTotalIncorrect();
      }
      _updateHandStats(deviationsState.wasPlayerCorrect);
      _previousHand = deviationsState.currentFlashcard;
    });
  }

  _updateHandStats(wasPlayCorrect) {
    if (_previousHand != null) {
      var dealer = _previousHand['dealer'];
      var player = _previousHand['player'];
      var matrix = state.deviationsStatsMatrix;
      var columnIndex;
      columnIndex = matrix[0].indexWhere((element) => element == dealer);
      var rowIndex;
      for (var i = 0; i < matrix.length; i++) {
        if (matrix[i][0] == player) rowIndex = i;
      }
      if (player == '10,10') {
        rowIndex = 1;
      }

      var currentPlayStat = matrix[rowIndex][columnIndex];
      var currentPlayed = currentPlayStat['played'];
      var currentCorrect = currentPlayStat['correct'];

      double newPlayed = currentPlayed + 1.0;
      double newCorrect = currentCorrect;
      if (wasPlayCorrect) newCorrect += 1.0;

      var newPercentage;
      if (newCorrect == 0.0) {
        newPercentage = 0.0;
      } else {
        newPercentage = newCorrect / newPlayed;
      }

      var newStat = {
        'played': newPlayed,
        'correct': newCorrect,
        'percentage': newPercentage
      };

      List updatedMatrix = [...matrix];
      updatedMatrix[rowIndex][columnIndex] = newStat;
      
      emit(DeviationsSessionStatsState(
      streak: state.streak,
      totalPlayed: state.totalPlayed,
      totalCorrect: state.totalCorrect,
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
      deviationsStatsMatrix: updatedMatrix,
    ));

    }
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
      deviationsStatsMatrix: state.deviationsStatsMatrix,
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
      deviationsStatsMatrix: state.deviationsStatsMatrix,
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
