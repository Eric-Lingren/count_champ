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
    return (Scaffold(
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
    ))));
  }
}