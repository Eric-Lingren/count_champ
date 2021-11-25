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
              return Text(state.handsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hardHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.softHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.pairHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.illustrious18HandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.fab4HandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsPlayed.toString());
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
              return Text(state.correctHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hardHandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.softHandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.pairHandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.illustrious18HandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.fab4HandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsCorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsCorrect.toString());
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
              return Text(state.incorrectHandsPlayed.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.hardHandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.softHandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.pairHandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.illustrious18HandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.fab4HandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsIncorrect.toString());
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              return Text(state.insuranceHandsIncorrect.toString());
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
                  (state.correctHandsPlayed / state.handsPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.hardHandsCorrect / state.hardHandsPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.softHandsCorrect / state.softHandsPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.pairHandsCorrect / state.pairHandsPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage = (state.illustrious18HandsCorrect /
                      state.illustrious18HandsPlayed) *
                  100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.fab4HandsCorrect / state.fab4HandsPlayed) * 100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.insuranceHandsCorrect / state.insuranceHandsPlayed) *
                      100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.insuranceHandsCorrect / state.insuranceHandsPlayed) *
                      100;
              if (percentage.isNaN) percentage = 0;
              return Text(percentage.toStringAsFixed(2) + '%');
            }),
            BlocBuilder<RunningCountAlltimeStatsCubit,
                RunningCountAlltimeStatsState>(builder: (context, state) {
              double percentage =
                  (state.insuranceHandsCorrect / state.insuranceHandsPlayed) *
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
