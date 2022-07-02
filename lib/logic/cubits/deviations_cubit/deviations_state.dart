part of 'deviations_cubit.dart';

class DeviationsState extends Equatable {
  bool isPlayingDeviations;
  List deviationFlashcards;
  var currentFlashcard;
  List buttonAnswerOptions;
  bool wasPlayerCorrect;
  List deviationsChartMatrix;
  String deviationsChartTitle;

  DeviationsState({
    required this.isPlayingDeviations,
    required this.deviationFlashcards,
    required this.currentFlashcard,
    required this.buttonAnswerOptions,
    required this.wasPlayerCorrect,
    required this.deviationsChartMatrix,
    required this.deviationsChartTitle,
  });

  @override
  List<Object?> get props => [
        isPlayingDeviations,
        deviationFlashcards,
        currentFlashcard,
        buttonAnswerOptions,
        wasPlayerCorrect,
        deviationsChartMatrix,
        deviationsChartTitle,
      ];
}
