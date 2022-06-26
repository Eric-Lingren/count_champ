import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import 'dart:async';
import 'package:count_champ/constants/deviation_flashcards/hilo_deviation_flashcards.dart';
import 'package:count_champ/logic/cubits/settings/deviations_settings_cubit/deviations_settings_cubit.dart';
part 'deviations_state.dart';

class DeviationsCubit extends Cubit<DeviationsState> {
  var deviationFlashcards;
  var currentFlashcard;
  var _practiceIllustrious18;
  var _practiceInsurance;
  var _practiceFab4;
  final DeviationsSettingsCubit deviationsSettingsCubit;
  late StreamSubscription deviationsSettingsStreamSubscription;

  DeviationsCubit({
    required this.deviationsSettingsCubit,
    deviationsSettingsStreamSubscription,
  }) : super(DeviationsState(
          isPlayingDeviations: false,
          deviationFlashcards: hiloIllustrious18DeviationFlashcards,
          currentFlashcard: hiloIllustrious18DeviationFlashcards[0],
          buttonAnswerOptions: [-1,0,1,2],
          wasPlayerCorrect: true,
        )) {
    _monitorDeviationsSettingsCubit();
  }

  StreamSubscription<DeviationsSettingsState>
      _monitorDeviationsSettingsCubit() {
    return deviationsSettingsStreamSubscription =
        deviationsSettingsCubit.stream.listen((deviationsSettingsState) {
      _practiceIllustrious18 = deviationsSettingsState.practiceIllustrious18;
      _practiceInsurance = deviationsSettingsState.practiceInsurance;
      _practiceFab4 = deviationsSettingsState.practiceFab4;
      _setFlashcardList();
    });
  }

  _setFlashcardList() {
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

    emit(DeviationsState(
        isPlayingDeviations: state.isPlayingDeviations,
        currentFlashcard: state.currentFlashcard,
        deviationFlashcards: tempFlashcardList,
        buttonAnswerOptions: state.buttonAnswerOptions,
        wasPlayerCorrect: state.wasPlayerCorrect));
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
    // var newFlashcard = state.deviationFlashcards[index];
    // var buttonAnswerOptions = _generateButtonChoices(newFlashcard);
    // emit(DeviationsState(
    //   isPlayingDeviations: state.isPlayingDeviations,
    //   deviationFlashcards: state.deviationFlashcards,
    //   currentFlashcard: newFlashcard,
    //   buttonAnswerOptions: buttonAnswerOptions,
    //   wasPlayerCorrect: state.wasPlayerCorrect,
    // ));
  }

  _generateRandomNumber(min, max) {
    Random rnd = new Random();
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

    // emit(DeviationsState(
    //   isPlayingDeviations: state.isPlayingDeviations,
    //   deviationFlashcards: state.deviationFlashcards,
    //   currentFlashcard: state.currentFlashcard,
    //   buttonAnswerOptions: buttonAnswerOptions,
    //   wasPlayerCorrect: state.wasPlayerCorrect,
    // ));
  }

  @override
  Future<void> close() {
    deviationsSettingsStreamSubscription.cancel();
    return super.close();
  }
}
