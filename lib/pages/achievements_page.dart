import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Achievements'),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              const Text('Achievements'),
              const Text('1 Hand Played Achievement'),
              BlocBuilder<AchievementsCubit, AchievementsState>(
                  builder: (context, state) {
                return Text(state.bsTotalPlayedAchievement.toString() );
              }),
              const Text('5 Hand Played Achievement'),
              // BlocBuilder<AchievementsCubit, AchievementsState>(
              //     builder: (context, state) {
              //   return Text(state.reached5HandsPlayed.toString() );
              // }),
            ],
          ),
        )));
  }
}
