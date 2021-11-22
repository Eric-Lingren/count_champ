import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:count_champ/logic/cubits/basic_strategey_stats_cubit copy/basic_strategey_stats_cubit.dart';
import 'package:test_api/expect.dart';

class BasicStrategeyStats extends StatelessWidget {
  const BasicStrategeyStats({Key? key}) : super(key: key);

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
          title: const Text('Basic Strategey Stats'),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Type'),
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
                  const Text('Played'),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.handsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsPlayed.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Correct'),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.correctHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsCorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsCorrect.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Incorrect'),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.incorrectHandsPlayed.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.hardHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.softHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.pairHandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.illustrious18HandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.fab4HandsIncorrect.toString());
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    return Text(state.insuranceHandsIncorrect.toString());
                  }),
                ],
              ),
              Column(
                children: [
                  const Text('Accuracy'),
                  const SizedBox(height:10),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.correctHandsPlayed / state.handsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.hardHandsCorrect /state.hardHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.softHandsCorrect / state.softHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.pairHandsCorrect / state.pairHandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.illustrious18HandsCorrect / state.illustrious18HandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
                      builder: (context, state) {
                    double percentage =
                        (state.fab4HandsCorrect / state.fab4HandsPlayed) * 100;
                    if (percentage.isNaN) percentage = 0;
                    return Text(percentage.toStringAsFixed(2) + '%');
                  }),
                  BlocBuilder<BasicStrategeyStatsCubit, BasicStrategeyStatsState>(
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
          )));
  }
}
