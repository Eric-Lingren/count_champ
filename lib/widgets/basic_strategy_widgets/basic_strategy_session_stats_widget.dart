import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/session/basic_strategy_session_stats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api/expect.dart';

class BasicStrategySessionStats extends StatelessWidget {
  const BasicStrategySessionStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height:10),
                  Text('Total Hands:'),
                  Text('Hard Hands:'),
                  Text('Soft Hands:'),
                  Text('Pair Hands:'),
                  Text('Illustrious18:'),
                  Text('Fab4:'),
                  Text('Insurance:'),
                ],
              ),
              Column(
                children: [
                  const Text('Played', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.handsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsPlayed.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Correct', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.correctHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsCorrect.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Incorrect', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.incorrectHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsIncorrect.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Accuracy', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.correctHandsPlayed / state.handsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.hardHandsCorrect /state.hardHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.softHandsCorrect / state.softHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.pairHandsCorrect / state.pairHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.illustrious18HandsCorrect / state.illustrious18HandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.fab4HandsCorrect / state.fab4HandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategySessionStatsCubit, BasicStrategySessionStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.insuranceHandsCorrect / state.insuranceHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                ],
              ),
              const SizedBox(),
            ],
        ),
    );
  
}}