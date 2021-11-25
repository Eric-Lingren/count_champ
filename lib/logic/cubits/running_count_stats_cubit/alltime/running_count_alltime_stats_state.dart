part of 'running_count_alltime_stats_cubit.dart';

class RunningCountAlltimeStatsState extends Equatable {

  int streak;
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

  RunningCountAlltimeStatsState({
    required this.streak,
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
    streak,
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


  Map<String, dynamic> toMap() {
    return {
      'streak': streak,
      'totalRuns': totalRuns,
      'correctRuns': correctRuns,
      'incorrectRuns': incorrectRuns,
      'hiloPlayed': hiloPlayed,
      'hiloCorrect': hiloCorrect,
      'hiloIncorrect': hiloIncorrect,
      'hiopt1Played': hiopt1Played,
      'hiopt1Correct': hiopt1Correct,
      'hiopt1Incorrect': hiopt1Incorrect,
      'hiopt2Played': hiopt2Played,
      'hiopt2Correct': hiopt2Correct,
      'hiopt2Incorrect': hiopt2Incorrect,
      'halvesPlayed': halvesPlayed,
      'halvesCorrect': halvesCorrect,
      'halvesIncorrect': halvesIncorrect,
      'koPlayed': koPlayed,
      'koCorrect': koCorrect,
      'koIncorrect': koIncorrect,
      'red7Played': red7Played,
      'red7Correct': red7Correct,
      'red7Incorrect': red7Incorrect,
      'zenPlayed': zenPlayed,
      'zenCorrect': zenCorrect,
      'zenIncorrect': zenIncorrect,
      'omega2Played': omega2Played,
      'omega2Correct': omega2Correct,
      'omega2Incorrect': omega2Incorrect,
    };
  }

  factory RunningCountAlltimeStatsState.fromMap(Map<String, dynamic> map) {
    return RunningCountAlltimeStatsState(
      streak: map['streak'],
      totalRuns: map['totalRuns'],
      correctRuns: map['correctRuns'],
      incorrectRuns: map['incorrectRuns'],
      hiloPlayed: map['hiloPlayed'],
      hiloCorrect: map['hiloCorrect'],
      hiloIncorrect: map['hiloIncorrect'],
      hiopt1Played: map['hiopt1Played'],
      hiopt1Correct: map['hiopt1Correct'],
      hiopt1Incorrect: map['hiopt1Incorrect'],
      hiopt2Played: map['hiopt2Played'],
      hiopt2Correct: map['hiopt2Correct'],
      hiopt2Incorrect: map['hiopt2Incorrect'],
      halvesPlayed: map['halvesPlayed'],
      halvesCorrect: map['halvesCorrect'],
      halvesIncorrect: map['halvesIncorrect'],
      koPlayed: map['koPlayed'],
      koCorrect: map['koCorrect'],
      koIncorrect: map['koIncorrect'],
      red7Played: map['red7Played'],
      red7Correct: map['red7Correct'],
      red7Incorrect: map['red7Incorrect'],
      zenPlayed: map['zenPlayed'],
      zenCorrect: map['zenCorrect'],
      zenIncorrect: map['zenIncorrect'],
      omega2Played: map['omega2Played'],
      omega2Correct: map['omega2Correct'],
      omega2Incorrect: map['omega2Incorrect'],
    );
  }

  @override
  RunningCountAlltimeStatsState? fromJson(Map<String, dynamic> json) {
    return RunningCountAlltimeStatsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RunningCountAlltimeStatsState state) {
    return state.toMap();
  }

}
