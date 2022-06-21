import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:count_champ/widgets/global_widgets/achievement_unlocked_alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return (
      Container(
        // color: Colors.black,
        // width: 100,
        // height: 300,
        // decoration: const BoxDecoration(
        //   color: Colors.green
        // ),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("images/cards/card_backs/card_back_red_1.png"), 
        //       // image: AssetImage("images/backgrounds/cardsBackground.jpeg"), 
        //       fit: BoxFit.cover
        //   )
        // ),
        // return Image(
        //   image: AssetImage(imagePath),
        //   width: 140, // TODO - Make card image dimensions dynamic based on screen size
        // );

        child:
      Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        BlocBuilder<AchievementsCubit, AchievementsState>(
            builder: (context, achievementsState) {
          return const Text('Welcome to Count Champ!');
        }),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basic_strategy_trainer');
            },
            child: const Text('Basic Strategy')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/running_count_trainer');
            },
            child: const Text('Count Trainer')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/achievements');
            },
            child: const Text('Achievements')),
        BlocBuilder<AchievementsCubit, AchievementsState>(
          builder: (context, state) {
            if (state.achievementReached == true) {
              return const SizedBox(
                height: 200,
                child: AchievementUnlockedAlertWidget(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    )))));
  }
}