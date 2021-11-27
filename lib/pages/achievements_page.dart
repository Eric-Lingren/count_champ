import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:count_champ/widgets/achievements/achievements_chip_row.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: const Text(
                      'Basic Strategy Hands Played',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),

              BlocBuilder<AchievementsCubit, AchievementsState>(
                  builder: (context, state) {
                return AchievementsChipRow(achievements: state.bsTotalPlayedAchievement);
              }),

            ],
          ),
        )));
  }
}
