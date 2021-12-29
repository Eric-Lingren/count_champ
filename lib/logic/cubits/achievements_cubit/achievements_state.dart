part of 'achievements_cubit.dart';

class AchievementsState extends Equatable {
  bool achievementReached;
  String achievementText;
  String achievementImagePath;
  int bsTotalPlayedAchievement;

  AchievementsState({
    required this.achievementReached,
    required this.achievementText,
    required this.achievementImagePath,
    required this.bsTotalPlayedAchievement,
  });

  @override
  List<Object> get props => [
        achievementReached,
        achievementText,
        achievementImagePath,
        bsTotalPlayedAchievement,
      ];

  Map<String, dynamic> toMap() {
    return {
      'achievementReached': achievementReached,
      'achievementText': achievementText,
      'achievementImagePath': achievementImagePath,
      'bsTotalPlayedAchievement': bsTotalPlayedAchievement,
    };
  }

  factory AchievementsState.fromMap(Map<String, dynamic> map) {
    return AchievementsState(
      achievementReached: map['achievementReached'],
      achievementText: map['achievementText'],
      achievementImagePath: map['achievementImagePath'],
      bsTotalPlayedAchievement: map['bsTotalPlayedAchievement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievementsState.fromJson(String source) =>
      AchievementsState.fromMap(json.decode(source));
}
