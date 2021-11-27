part of 'achievements_cubit.dart';

class AchievementsState extends Equatable {
  // bool reached1HandsPlayed;
  // bool reached5HandsPlayed;
  bool achievementReached;
  String achievementText;
  String achievementImagePath;
  int bsTotalPlayedAchievement;

  AchievementsState({
    // required this.reached1HandsPlayed,
    //required this.reached5HandsPlayed,
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
}
