import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RunningCountHeaderWidget extends StatelessWidget {


  const RunningCountHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
        height: 50,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
                    builder: (context, state) {
                      return Text(
                        'Streak: ' + state.correctRuns.toString()
                      );
                    }),


                  Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Column(children: [
                    IconButton(
                      icon: const Icon(Icons.show_chart_outlined,
                          color: Colors.black, size: 36.0),
                      onPressed: () {
                        Navigator.pushNamed(context, '/running_count_stats');
                      },
                    ),
                  ]),
                ),
                ]),
          ],
        ));
  }
}
