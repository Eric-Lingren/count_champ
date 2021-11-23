
part of 'basic_strategy_alltime_stats_cubit.dart';


class BasicStrategyAlltimeStatsState extends Equatable {
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

  BasicStrategyAlltimeStatsState({
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


  Map<String, dynamic> toMap() {
    return {
      'currentStreak': currentStreak,
      'handsPlayed': handsPlayed,
      'correctHandsPlayed': correctHandsPlayed,
      'incorrectHandsPlayed': incorrectHandsPlayed,
      'hardHandsPlayed': hardHandsPlayed,
      'hardHandsCorrect': hardHandsCorrect,
      'hardHandsIncorrect': hardHandsIncorrect,
      'softHandsPlayed': softHandsPlayed,
      'softHandsCorrect': softHandsCorrect,
      'softHandsIncorrect': softHandsIncorrect,
      'pairHandsPlayed': pairHandsPlayed,
      'pairHandsCorrect': pairHandsCorrect,
      'pairHandsIncorrect': pairHandsIncorrect,
      'illustrious18HandsPlayed': illustrious18HandsPlayed,
      'illustrious18HandsCorrect': illustrious18HandsCorrect,
      'illustrious18HandsIncorrect': illustrious18HandsIncorrect,
      'fab4HandsPlayed': fab4HandsPlayed,
      'fab4HandsCorrect': fab4HandsCorrect,
      'fab4HandsIncorrect': fab4HandsIncorrect,
      'insuranceHandsPlayed': insuranceHandsPlayed,
      'insuranceHandsCorrect': insuranceHandsCorrect,
      'insuranceHandsIncorrect': insuranceHandsIncorrect,
    };
  }

  factory BasicStrategyAlltimeStatsState.fromMap(Map<String, dynamic> map) {
    return BasicStrategyAlltimeStatsState(
      currentStreak: map['currentStreak'],
      handsPlayed: map['handsPlayed'],
      correctHandsPlayed: map['correctHandsPlayed'],
      incorrectHandsPlayed: map['incorrectHandsPlayed'],
      hardHandsPlayed: map['hardHandsPlayed'],
      hardHandsCorrect: map['hardHandsCorrect'],
      hardHandsIncorrect: map['hardHandsIncorrect'],
      softHandsPlayed: map['softHandsPlayed'],
      softHandsCorrect: map['softHandsCorrect'],
      softHandsIncorrect: map['softHandsIncorrect'],
      pairHandsPlayed: map['pairHandsPlayed'],
      pairHandsCorrect: map['pairHandsCorrect'],
      pairHandsIncorrect: map['pairHandsIncorrect'],
      illustrious18HandsPlayed: map['illustrious18HandsPlayed'],
      illustrious18HandsCorrect: map['illustrious18HandsCorrect'],
      illustrious18HandsIncorrect: map['illustrious18HandsIncorrect'],
      fab4HandsPlayed: map['fab4HandsPlayed'],
      fab4HandsCorrect: map['fab4HandsCorrect'],
      fab4HandsIncorrect: map['fab4HandsIncorrect'],
      insuranceHandsPlayed: map['insuranceHandsPlayed'],
      insuranceHandsCorrect: map['insuranceHandsCorrect'],
      insuranceHandsIncorrect: map['insuranceHandsIncorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicStrategyAlltimeStatsState.fromJson(String source) => BasicStrategyAlltimeStatsState.fromMap(json.decode(source));
}
