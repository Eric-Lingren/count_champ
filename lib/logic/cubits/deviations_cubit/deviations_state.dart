part of 'deviations_cubit.dart';

class DeviationsState extends Equatable {
  bool isPlayingDeviations;
  List deviationFlashcards;
  var currentFlashcard;
  List buttonAnswerOptions;
  bool wasPlayerCorrect;

  DeviationsState({
    required this.isPlayingDeviations,
    required this.deviationFlashcards,
    required this.currentFlashcard,
    required this.buttonAnswerOptions,
    required this.wasPlayerCorrect,
  });

  @override
  List<Object?> get props => [
        isPlayingDeviations,
        deviationFlashcards,
        currentFlashcard,
        buttonAnswerOptions,
        wasPlayerCorrect
      ];
}
