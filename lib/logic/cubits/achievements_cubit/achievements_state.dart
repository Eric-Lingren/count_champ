part of 'achievements_cubit.dart';

class AchievementsState extends Equatable {
  // bool reached1HandsPlayed;
  // bool reached5HandsPlayed;

  int bsTotalPlayedAchievement;

  AchievementsState({
    // required this.reached1HandsPlayed, 
    //required this.reached5HandsPlayed,
    required this.bsTotalPlayedAchievement,
  });

  @override
  List<Object> get props => [
        bsTotalPlayedAchievement,
      ];
}
