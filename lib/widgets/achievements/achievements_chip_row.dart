import 'package:flutter/cupertino.dart';

class AchievementsChipRow extends StatelessWidget {
  final int achievements;
  final List achievementImages = [
    'assets/images/chips/1_white.png',
    'assets/images/chips/5_red.png',
    'assets/images/chips/25_green.png',
    'assets/images/chips/100_black.png',
    'assets/images/chips/500_purple.png',
    'assets/images/chips/1000_orange.png',
    'assets/images/chips/5000_grey.png',
  ];

  AchievementsChipRow({Key? key, required this.achievements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int test = 5;
    final List achievementLevels = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    int lastAchievementIndex =
        achievementLevels.indexWhere((i) => i > achievements);
    // print(lastAchievementIndex);

    List userAchievements = achievementImages.sublist(0, lastAchievementIndex);

    int missingAchievements =
        (achievementLevels.length - userAchievements.length)-2;
    print(missingAchievements);
    print('----------------');
    for (int i = 0; i < missingAchievements; i++) {
      print(i);
      userAchievements.add('assets/images/chips/circle.png');
    }

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: userAchievements
              .map<Widget>(
                (chipPath) => Container(
                  // margin: const EdgeInsets.only(left: 30.0),
                  margin: const EdgeInsets.only(
                    left: 2.0,
                  ),
                  // child: Positioned(
                  // top: -150,
                  child: Image(
                      image: AssetImage(chipPath),
                      width: 45,
                      height:
                          45), // TODO make this synamic based on screen size
                  // ),
                ),
              )
              .toList()),
    );
  }
}
