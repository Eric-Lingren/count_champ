part of 'deviations_settings_cubit.dart';

class DeviationsSettingsState extends Equatable {
  double deckQuantity;
  bool hiLoEnabled;
  bool koEnabled;
  bool rekoEnabled;
  bool practiceIllustrious18;
  bool practiceFab4;
  bool practiceInsurance;

  DeviationsSettingsState({
    required this.deckQuantity,
    required this.hiLoEnabled,
    required this.koEnabled,
    required this.rekoEnabled,
    required this.practiceIllustrious18,
    required this.practiceFab4,
    required this.practiceInsurance,
  });

  @override
  List<Object?> get props => [
        deckQuantity,
        hiLoEnabled,
        koEnabled,
        rekoEnabled,
        practiceIllustrious18,
        practiceFab4,
        practiceInsurance,
      ];
}
