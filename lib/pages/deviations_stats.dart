import 'package:count_champ/logic/cubits/running_count_stats_cubit/alltime/running_count_alltime_stats_cubit.dart';
import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
import 'package:count_champ/widgets/count_widgets/running_count_alltime_stats_widget.dart';
import 'package:count_champ/widgets/deviations_widgets/deviations_session_stats_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviationsStats extends StatelessWidget {
  const DeviationsStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff28734D),
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
          title: const Text('Deviations Stats'),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              const Text(
                'Session Statistics',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),

              BlocBuilder<DeviationsSessionStatsCubit, DeviationsSessionStatsState>(
                  builder: (context, state) {
                double percentage =
                    (state.totalCorrect / state.totalPlayed) * 100;
                if (percentage.isNaN) percentage = 0;
                return Text(
                  percentage.toStringAsFixed(2) + '%',
                  style: const TextStyle(fontSize: 20),
                );
              }),

              const SizedBox(height: 10),

              BlocBuilder<DeviationsSessionStatsCubit, DeviationsSessionStatsState>(
                  builder: (context, state) {
                return Text(
                  '${state.totalCorrect} of ${state.totalPlayed} flashcards correct',
                  style: const TextStyle(fontSize: 14),
                );
              }),

              const SizedBox(height: 20),
              const DeviationsSessionStats(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'All Time Statistics',
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      // context
                      //         .read<RunningCountAlltimeStatsCubit>()
                      //         .clearAlltimeStats();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // const RunningCountAlltimeStats(),
            ],
          ),
        )));
  }
}
