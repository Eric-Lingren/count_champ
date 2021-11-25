import 'package:count_champ/logic/cubits/running_count_stats_cubit/alltime/running_count_alltime_stats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RunningCountAlltimeStats extends StatelessWidget {
  const RunningCountAlltimeStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Total Runs:'),
            Text('Hi-Lo:'),
            Text('Hi-Opt I:'),
            Text('Hi-Opt II:'),
            Text('Halves:'),
            Text('Knockout:'),
            Text('Red 7:'),
            Text('Zen:'),
            Text('Omega II:'),
          ],
        ),
        Column(
          children: [
            Text('Played', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.totalRuns.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiloPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt1Played.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt2Played.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.halvesPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.koPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.red7Played.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.zenPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.omega2Played.toString());
            }),
          ],
        ),
        // ],
        // children: [
        Column(
          children: [
            const Text('Correct',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.correctRuns.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiloCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt1Correct.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt2Correct.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.halvesCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.koCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.red7Correct.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.zenCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.omega2Correct.toString());
            }),
          ],
        ),
        Column(
          children: [
            const Text('Incorrect',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.incorrectRuns.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiloIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt1Incorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hiopt2Incorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.halvesIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.koIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.red7Incorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.zenIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.omega2Incorrect.toString());
            }),
          ],
        ),
        Column(
          children: [
            const Text('Accuracy',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.correctRuns / state.totalRuns) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.hiloCorrect / state.hiloPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.hiopt1Correct / state.hiopt1Played) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.hiopt2Correct / state.hiopt2Played) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage = (state.halvesCorrect /
                      state.halvesPlayed) *
                  100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.koCorrect / state.koPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.red7Correct / state.red7Played) *
                      100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.zenCorrect / state.zenPlayed) *
                      100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.omega2Correct / state.omega2Played) *
                      100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
