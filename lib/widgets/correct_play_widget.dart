import 'package:count_champ/logic/cubits/achievements_cubit/bs_achievements_cubit/bs_achievements_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/alltime/basic_strategy_alltime_stats_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/session/basic_strategy_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/widgets/basic_strategy_widgets/bs_plays/bs_plays_row/bs_plays_dealer_row.dart';
import 'package:count_champ/widgets/basic_strategy_widgets/bs_plays/bs_plays_row/bs_plays_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorrectPlayWidget extends StatelessWidget {
  final bool playWasCorrect;
  final String correctPlay;
  final String hand;
  final int playerTotal;
  final List bsPlays;

  const CorrectPlayWidget({
    Key? key,
    required this.playWasCorrect,
    required this.correctPlay,
    required this.hand,
    required this.playerTotal,
    required this.bsPlays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String wasCorrect = '';
    Color? backgroundColor;
    bool showingBsPlaysRow = false;

    if (playWasCorrect == true) {
      backgroundColor = Colors.green[300];
      showingBsPlaysRow = false;
    } else if (playWasCorrect == false) {
      wasCorrect = 'Correct Play Was: ' + correctPlay.toUpperCase();
      backgroundColor = Colors.red[100];
      showingBsPlaysRow = true;
    } else {
      wasCorrect = 'ERROR - Something Broke';
      backgroundColor = Colors.purple[100];
      showingBsPlaysRow = false;
    }

    return Container(
        color: backgroundColor,
        height: 90,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(hand),
                        Text(wasCorrect),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Streak:'),
                      BlocBuilder<BasicStrategySessionStatsCubit,
                              BasicStrategySessionStatsState>(
                          builder: (context, bsSessionStatsState) {
                        return BlocBuilder<BasicStrategyAlltimeStatsCubit,
                                BasicStrategyAlltimeStatsState>(
                            builder: (context, bsAlltimeStatsState) {
                          return BlocBuilder<BsAchievementsCubit,
                                BsAchievementsState>(
                            builder: (context, bsAchievementsState) {
                          return Text(bsSessionStatsState.currentStreak.toString());
                        });
                        });
                      }),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Column(children: [
                      IconButton(
                        icon: const Icon(Icons.show_chart_outlined,
                            color: Colors.black, size: 36.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/basic_strategy_stats');
                        },
                      ),
                    ]),
                  )
                ]),
            if (showingBsPlaysRow == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Dealer:'),
                        BlocBuilder<CorrectPlaysCubit, CorrectPlaysState>(
                            builder: (context, state) {
                          return Text(
                              'Player: ' + state.playerTotal.toString());
                        }),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      BsPlaysDealerRow(),
                      BsPlaysRow(bsPlays: bsPlays),
                    ],
                  ),
                ],
              ),
          ],
        ));
  }
}
