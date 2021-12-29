import 'package:flutter/cupertino.dart';

class AchievementsChipRow extends StatelessWidget {
  final int achievements;
  final List achievementLevels;
  final List achievementImages = [
    'assets/images/chips/1_white.png',
    'assets/images/chips/5_red.png',
    'assets/images/chips/25_green.png',
    'assets/images/chips/100_black.png',
    'assets/images/chips/500_purple.png',
    'assets/images/chips/1000_orange.png',
    'assets/images/chips/5000_grey.png',
  ];

  AchievementsChipRow(
      {Key? key, required this.achievements, required this.achievementLevels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nextAchievementLevel = 'All Levels Complete';
    int lastAchievementIndex =
        achievementLevels.indexWhere((i) => i > achievements);

    if (lastAchievementIndex >= 0) {
      int nextAchievement = achievementLevels[lastAchievementIndex];
      nextAchievementLevel = nextAchievement.toString();
    } else {
      lastAchievementIndex = achievementLevels.length;
    }

    List userAchievements = achievementImages.sublist(0, lastAchievementIndex);
    int missingAchievements =
        (achievementLevels.length - userAchievements.length);

    for (int i = 0; i < missingAchievements; i++) {
      userAchievements.add('assets/images/chips/circle.png');
    }

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Goal: $nextAchievementLevel',
            style: const TextStyle(fontSize: 12),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: userAchievements
                  .map<Widget>(
                    (chipPath) => Container(
                      margin: const EdgeInsets.only(
                        left: 2.0,
                        top: 10,
                      ),
                      child: Image(
                          image: AssetImage(chipPath),
                          width: 45,
                          height:
                              45), // TODO make this synamic based on screen size
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
