part of 'running_count_session_stats_cubit.dart';

class RunningCountSessionStatsState extends Equatable {

  int totalRuns;
  int correctRuns;
  int incorrectRuns;
  int hiloPlayed;
  int hiloCorrect;
  int hiloIncorrect;
  int hiopt1Played;
  int hiopt1Correct;
  int hiopt1Incorrect;
  int hiopt2Played;
  int hiopt2Correct;
  int hiopt2Incorrect;
  int halvesPlayed;
  int halvesCorrect;
  int halvesIncorrect;
  int koPlayed;
  int koCorrect;
  int koIncorrect;
  int red7Played;
  int red7Correct;
  int red7Incorrect;
  int zenPlayed;
  int zenCorrect;
  int zenIncorrect;
  int omega2Played;
  int omega2Correct;
  int omega2Incorrect;

  RunningCountSessionStatsState({
    required this.totalRuns,
    required this.correctRuns,
    required this.incorrectRuns,
    required this.hiloPlayed,
    required this.hiloCorrect,
    required this.hiloIncorrect,
    required this.hiopt1Played,
    required this.hiopt1Correct,
    required this.hiopt1Incorrect,
    required this.hiopt2Played,
    required this.hiopt2Correct,
    required this.hiopt2Incorrect,
    required this.halvesPlayed,
    required this.halvesCorrect,
    required this.halvesIncorrect,
    required this.koPlayed,
    required this.koCorrect,
    required this.koIncorrect,
    required this.red7Played,
    required this.red7Correct,
    required this.red7Incorrect,
    required this.zenPlayed,
    required this.zenCorrect,
    required this.zenIncorrect,
    required this.omega2Played,
    required this.omega2Correct,
    required this.omega2Incorrect,
  });

  @override
  List<Object> get props => [
    totalRuns, 
    correctRuns, 
    incorrectRuns, 
    hiloPlayed, 
    hiloCorrect, 
    hiloIncorrect, 
    hiopt1Played, 
    hiopt1Correct, 
    hiopt1Incorrect, 
    hiopt2Played, 
    hiopt2Correct, 
    hiopt2Incorrect,
    halvesPlayed, 
    halvesCorrect, 
    halvesIncorrect, 
    koPlayed, 
    koCorrect, 
    koIncorrect, 
    red7Played, 
    red7Correct, 
    red7Incorrect,
    zenPlayed, 
    zenCorrect, 
    zenIncorrect,
    omega2Played, 
    omega2Correct, 
    omega2Incorrect,
  ];

}
