part of 'deviations_session_stats_cubit.dart';

class DeviationsSessionStatsState extends Equatable {

  int streak;
  int totalPlayed;
  int totalCorrect;
  int totalIncorrect;
  int illustrious18Played;
  int illustrious18Correct;
  int illustrious18Incorrect;
  int fab4Played;
  int fab4Correct;
  int fab4Incorrect;
  int insurancePlayed;
  int insuranceCorrect;
  int insuranceIncorrect;


  DeviationsSessionStatsState({
    required this. streak,
    required this. totalPlayed,
    required this. totalCorrect,
    required this. totalIncorrect,
    required this. illustrious18Played,
    required this. illustrious18Correct,
    required this. illustrious18Incorrect,
    required this. fab4Played,
    required this. fab4Correct,
    required this. fab4Incorrect,
    required this. insurancePlayed,
    required this. insuranceCorrect,
    required this. insuranceIncorrect,
  });

  @override
  List<Object> get props => [
  streak,
  totalPlayed,
  totalCorrect,
  totalIncorrect,
  illustrious18Played,
  illustrious18Correct,
  illustrious18Incorrect,
  fab4Played,
  fab4Correct,
  fab4Incorrect,
  insurancePlayed,
  insuranceCorrect,
  insuranceIncorrect,
  ];

}
