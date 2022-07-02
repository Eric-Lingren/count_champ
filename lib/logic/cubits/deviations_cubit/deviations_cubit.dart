import 'package:bloc/bloc.dart';
import 'package:count_champ/constants/deviation_charts/hilo_deviation_charts.dart';
import 'package:count_champ/constants/deviation_charts/ko_deviations_charts/ko_8deck_deviation_charts.dart';
import 'package:count_champ/constants/deviation_charts/ko_deviations_charts/ko_deviation_charts.dart';
import 'package:count_champ/constants/deviation_charts/reko_deviation_charts.dart';
import 'package:count_champ/constants/deviation_flashcards/ko_deviation_flashcards.dart';
import 'package:count_champ/constants/deviation_flashcards/reko_deviation_flashcards.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import 'dart:async';
import 'package:count_champ/constants/deviation_flashcards/hilo_deviation_flashcards.dart';
import 'package:count_champ/logic/cubits/settings/deviations_settings_cubit/deviations_settings_cubit.dart';
part 'deviations_state.dart';

class DeviationsCubit extends Cubit<DeviationsState> {
  var deviationFlashcards;
  var currentFlashcard;
  double _deckQuantity = 8.0;
  var _hiloEnabled = true;
  var _koEnabled = false;
  var _rekoEnabled = false;
  var _practiceIllustrious18 = true;
  var _practiceInsurance = false;
  var _practiceFab4 = false;
  final DeviationsSettingsCubit deviationsSettingsCubit;
  late StreamSubscription deviationsSettingsStreamSubscription;

  DeviationsCubit({
    required this.deviationsSettingsCubit,
    deviationsSettingsStreamSubscription,
  }) : super(DeviationsState(
            isPlayingDeviations: false,
            deviationFlashcards: hiloIllustrious18DeviationFlashcards,
            currentFlashcard: hiloIllustrious18DeviationFlashcards[0],
            buttonAnswerOptions: const [-1, 0, 1, 2],
            wasPlayerCorrect: true,
            deviationsChartMatrix: hiloDeviationChart,
            deviationsChartTitle: 'HiLo Deviations')) {
    _monitorDeviationsSettingsCubit();
  }

  StreamSubscription<DeviationsSettingsState>
      _monitorDeviationsSettingsCubit() {
    return deviationsSettingsStreamSubscription =
        deviationsSettingsCubit.stream.listen((deviationsSettingsState) {
      _deckQuantity = deviationsSettingsState.deckQuantity;
      _practiceIllustrious18 = deviationsSettingsState.practiceIllustrious18;
      _practiceInsurance = deviationsSettingsState.practiceInsurance;
      _practiceFab4 = deviationsSettingsState.practiceFab4;
      _hiloEnabled = deviationsSettingsState.hiLoEnabled;
      _koEnabled = deviationsSettingsState.koEnabled;
      _rekoEnabled = deviationsSettingsState.rekoEnabled;
      _runGameSetup();
    });
  }

  _runGameSetup() {
    List tempFlashcardList = [];
    var tempChartMatrix;
    var tempDeviationsChartTitle;
    if (_hiloEnabled) {
      tempFlashcardList = _getHiLoFlashcardList();
      tempChartMatrix = hiloDeviationChart;
      tempDeviationsChartTitle = 'HiLo Deviations';
    } else if (_koEnabled) {
      tempFlashcardList = _getKoFlashcardList();
      print(_deckQuantity);
      if (_deckQuantity == 8) {
        tempChartMatrix = ko8DeckDeviationChart;
      }
    } else if (_rekoEnabled) {
      tempFlashcardList = _getRekoFlashcardList();
      tempChartMatrix = rekoDeviationChart;
      tempDeviationsChartTitle = 'Reko Deviations';
    }

    emit(DeviationsState(
      isPlayingDeviations: state.isPlayingDeviations,
      currentFlashcard: state.currentFlashcard,
      deviationFlashcards: tempFlashcardList,
      buttonAnswerOptions: state.buttonAnswerOptions,
      wasPlayerCorrect: state.wasPlayerCorrect,
      deviationsChartMatrix: tempChartMatrix,
      deviationsChartTitle: tempDeviationsChartTitle,
    ));
  }

  _getHiLoFlashcardList() {
    List tempFlashcardList = [];
    if (_practiceIllustrious18) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...hiloIllustrious18DeviationFlashcards
      ];
    }
    if (_practiceFab4) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...hiloFab4DeviationFlashcards
      ];
    }
    if (_practiceInsurance) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...hiloInsuranceDeviationFlashcards
      ];
    }
    return tempFlashcardList;
  }

  _getKoFlashcardList() {
    List tempFlashcardList = [...koAllDeckDeviationFlashcards];

    if (_deckQuantity == 8) {
      tempFlashcardList = [...tempFlashcardList, ...ko8DeckDeviationFlashcards];
    }
    if (_deckQuantity == 6) {
      tempFlashcardList = [...tempFlashcardList, ...ko6DeckDeviationFlashcards];
    }
    if (_deckQuantity == 2) {
      tempFlashcardList = [...tempFlashcardList, ...ko2DeckDeviationFlashcards];
    }
    if (_deckQuantity == 1) {
      tempFlashcardList = [...tempFlashcardList, ...ko1DeckDeviationFlashcards];
    }

    return tempFlashcardList;
  }

  _getRekoFlashcardList() {
    List tempFlashcardList = [];
    if (_practiceIllustrious18) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...reko8DeckIllustrious18DeviationFlashcards
      ];
      if (_deckQuantity == 6) {
        tempFlashcardList = [
          ...tempFlashcardList,
          ...koAllDeckDeviationFlashcards
        ];
      }
      if (_deckQuantity == 1) {
        tempFlashcardList = [
          ...tempFlashcardList,
          ...reko1DeckIllustrious18DeviationFlashcards
        ];
      }
    }
    if (_practiceFab4) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...rekoFab4DeviationFlashcards
      ];
    }
    if (_practiceInsurance) {
      tempFlashcardList = [
        ...tempFlashcardList,
        ...rekoInsuranceDeviationFlashcards
      ];
    }
    return tempFlashcardList;
  }

  void checkAnswer(playerChoice) {
    var correctAnswer = int.parse(state.currentFlashcard['answer']);
    var wasPlayerCorrect = false;
    if (correctAnswer == playerChoice) {
      wasPlayerCorrect = true;
    }

    var newFlashcard = _drawFlashcard();
    var buttonAnswerOptions = _generateButtonChoices(newFlashcard);

    emit(DeviationsState(
      isPlayingDeviations: state.isPlayingDeviations,
      deviationFlashcards: state.deviationFlashcards,
      currentFlashcard: newFlashcard,
      buttonAnswerOptions: buttonAnswerOptions,
      wasPlayerCorrect: wasPlayerCorrect,
      deviationsChartMatrix: state.deviationsChartMatrix,
      deviationsChartTitle: state.deviationsChartTitle,
    ));
  }

  _drawFlashcard() {
    int min = 0;
    int max = state.deviationFlashcards.length;
    var index = _generateRandomNumber(min, max);
    while (state.deviationFlashcards[index] == state.currentFlashcard) {
      index = _generateRandomNumber(min, max);
    }
    return state.deviationFlashcards[index];
  }

  _generateRandomNumber(min, max) {
    Random rnd = Random();
    int r = rnd.nextInt(max);
    return r;
  }

  _generateButtonChoices(newFlashcard) {
    int answer = int.parse(newFlashcard['answer']);
    var buttonAnswerOptions = [answer];

    for (var i = 0; i < 3; i++) {
      int r = _generateRandomNumber(0, 2);
      if (r == 0) {
        buttonAnswerOptions.add(buttonAnswerOptions[0] - 1);
      } else {
        buttonAnswerOptions
            .add(buttonAnswerOptions[buttonAnswerOptions.length - 1] + 1);
      }
      buttonAnswerOptions.sort();
    }
    return buttonAnswerOptions;
  }

  @override
  Future<void> close() {
    deviationsSettingsStreamSubscription.cancel();
    return super.close();
  }
}
