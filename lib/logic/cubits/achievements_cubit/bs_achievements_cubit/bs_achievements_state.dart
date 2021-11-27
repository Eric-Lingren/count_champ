part of 'bs_achievements_cubit.dart';

class BsAchievementsState extends Equatable {
  String bsAchievementText;
  String bsAchievementImagePath;
  int bsTotalPlayedAchievement;
  // bool reached1HandsPlayed;
  // bool reached5HandsPlayed;
  // bool reached50HandsPlayed;
  // bool reached50HardHandsPlayed;
  // bool reached50SoftHandsPlayed;
  // bool reached50PairHandsPlayed;
  // bool reached100HandsPlayed;
  // bool reached100HardHandsPlayed;
  // bool reached100SoftHandsPlayed;
  // bool reached100PairHandsPlayed;
  // bool reached250HandsPlayed;
  // bool reached250HardHandsPlayed;
  // bool reached250SoftHandsPlayed;
  // bool reached250PairHandsPlayed;
  // bool reached500HandsPlayed;
  // bool reached500HardHandsPlayed;
  // bool reached500SoftHandsPlayed;
  // bool reached500PairHandsPlayed;
  // bool reached1000HandsPlayed;
  // bool reached1000HardHandsPlayed;
  // bool reached1000SoftHandsPlayed;
  // bool reached1000PairHandsPlayed;
  // bool reached1500HandsPlayed;
  // bool reached1500HardHandsPlayed;
  // bool reached1500SoftHandsPlayed;
  // bool reached1500PairHandsPlayed;
  // bool reached2500HandsPlayed;
  // bool reached2500HardHandsPlayed;
  // bool reached2500SoftHandsPlayed;
  // bool reached2500PairHandsPlayed;
  // bool reached5000HandsPlayed;
  // bool reached5000HardHandsPlayed;
  // bool reached5000SoftHandsPlayed;
  // bool reached5000PairHandsPlayed;
  // bool reached10000HandsPlayed;
  // bool reached10000HardHandsPlayed;
  // bool reached10000SoftHandsPlayed;
  // bool reached10000PairHandsPlayed;

  BsAchievementsState({
    // this.reached1HandsPlayed = false,
    // this.reached5HandsPlayed = false,
    this.bsAchievementText = '',
    this.bsAchievementImagePath = '',
    this.bsTotalPlayedAchievement = 0,
  });

  @override
  List<Object> get props => [
        // reached1HandsPlayed,
        // reached5HandsPlayed,
        bsAchievementText,
        bsAchievementImagePath,
        bsTotalPlayedAchievement,
      ];
}
