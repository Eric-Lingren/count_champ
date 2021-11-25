import 'package:count_champ/logic/cubits/running_count_stats_cubit/alltime/running_count_alltime_stats_cubit.dart';
import 'package:count_champ/widgets/count_widgets/running_count_alltime_stats_widget.dart';
import 'package:count_champ/widgets/count_widgets/running_count_session_stats_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class RunningCountStats extends StatelessWidget {
  const RunningCountStats({Key? key}) : super(key: key);

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
          title: const Text('Running Count Stats'),
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
              const SizedBox(height: 20),
              const RunningCountSessionStats(),
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
                      context
                              .read<RunningCountAlltimeStatsCubit>()
                              .clearAlltimeStats();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const RunningCountAlltimeStats(),
            ],
          ),
        )));
  }
}
