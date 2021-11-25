part of 'running_count_session_stats_cubit.dart';

class RunningCountSessionStatsState extends Equatable {
  int currentStreak;
  int handsPlayed;
  int correctHandsPlayed;
  int incorrectHandsPlayed;
  int hardHandsPlayed;
  int hardHandsCorrect;
  int hardHandsIncorrect;
  int softHandsPlayed;
  int softHandsCorrect;
  int softHandsIncorrect;
  int pairHandsPlayed;
  int pairHandsCorrect;
  int pairHandsIncorrect;

  int illustrious18HandsPlayed;
  int illustrious18HandsCorrect;
  int illustrious18HandsIncorrect;
  int fab4HandsPlayed;
  int fab4HandsCorrect;
  int fab4HandsIncorrect;
  int insuranceHandsPlayed;
  int insuranceHandsCorrect;
  int insuranceHandsIncorrect;

  RunningCountSessionStatsState({
    required this.currentStreak,
    required this.handsPlayed,
    required this.correctHandsPlayed,
    required this.incorrectHandsPlayed,
    required this.hardHandsPlayed,
    required this.hardHandsCorrect,
    required this.hardHandsIncorrect,
    required this.softHandsPlayed,
    required this.softHandsCorrect,
    required this.softHandsIncorrect,
    required this.pairHandsPlayed,
    required this.pairHandsCorrect,
    required this.pairHandsIncorrect,
    required this.illustrious18HandsPlayed,
    required this.illustrious18HandsCorrect,
    required this.illustrious18HandsIncorrect,
    required this.fab4HandsPlayed,
    required this.fab4HandsCorrect,
    required this.fab4HandsIncorrect,
    required this.insuranceHandsPlayed,
    required this.insuranceHandsCorrect,
    required this.insuranceHandsIncorrect,
  });

  @override
  List<Object> get props => [
    currentStreak, 
    handsPlayed, 
    correctHandsPlayed, 
    incorrectHandsPlayed, 
    hardHandsPlayed, 
    hardHandsCorrect, 
    hardHandsIncorrect, 
    softHandsPlayed, 
    softHandsCorrect, 
    softHandsIncorrect, 
    pairHandsPlayed, 
    pairHandsCorrect, 
    pairHandsIncorrect,
    illustrious18HandsPlayed, 
    illustrious18HandsCorrect, 
    illustrious18HandsIncorrect, 
    fab4HandsPlayed, 
    fab4HandsCorrect, 
    fab4HandsIncorrect, 
    insuranceHandsPlayed, 
    insuranceHandsCorrect, 
    insuranceHandsIncorrect,
  ];

}
