part of 'deviations_settings_cubit.dart';

class DeviationsSettingsState extends Equatable {
  double deckQuantity;
  bool practiceIllustrious18;
  bool practiceFab4;
  bool practiceInsurance;
  List deviationFlashcards;

  DeviationsSettingsState({
    required this.deckQuantity,
    required this.practiceIllustrious18,
    required this.practiceFab4,
    required this.practiceInsurance,
    required this.deviationFlashcards,
  });

  @override
  List<Object?> get props => [
        deckQuantity,
        practiceIllustrious18,
        practiceFab4,
        practiceInsurance,
        deviationFlashcards,
      ];
}
