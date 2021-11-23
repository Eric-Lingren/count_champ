import 'package:count_champ/widgets/basic_strategey_widgets/basic_strategey_alltime_stats_widget.dart';
import 'package:count_champ/widgets/basic_strategey_widgets/basic_strategey_session_stats_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:count_champ/logic/cubits/basic_strategey_stats_cubit/alltime/basic_strategey_alltime_stats_cubit.dart';

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
          child: Column(
            children: [
              const Text(
                'Session Statistics',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              const BasicStrategeySessionStats(),
              const SizedBox(height: 40),
              const Text(
                'All Time Statistics',
                style: TextStyle(fontSize: 25),
              ),
              // IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   onPressed: () {
              //     context.read<BasicStrategeyAlltimeStats>().clear;
              //   },
              // ),
              ElevatedButton(
                  onPressed: () {
                    print('null');
                    // context.read<BasicStrategeyAlltimeStats>().clearAlltimeStats()
                  },
                  child: const Text('TEST ME')),
              const SizedBox(height: 20),
              const BasicStrategeyAlltimeStats(),
            ],
          ),
        )));
  }
}
