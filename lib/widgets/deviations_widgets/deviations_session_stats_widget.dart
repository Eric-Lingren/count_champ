import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api/expect.dart';

class DeviationsSessionStats extends StatelessWidget {
  const DeviationsSessionStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var matrix = [
      ['', '2', '3', '4', '5', '6', '7', '8', '9', 'A'], // Dealer
      ['20', 0.0, .1, .2, .3, .4, .5, .6, .7, .8],
      ['19', '', 999, '', '', .5, .9, 1.0, 0.0, .9],
    ];

    generateCellColor(value) {
      if (value <= .1) return Colors.red[800];
      if (value <= .2) return Colors.red[600];
      if (value <= .3) return Colors.red[400];
      if (value <= .4) return Colors.red[200];
      if (value <= .4) return Colors.red[100];
      if (value <= .5) return Colors.red[50];
      if (value <= .6) return Colors.green[100];
      if (value <= .7) return Colors.green[200];
      if (value <= .8) return Colors.green[400];
      if (value <= .9) return Colors.green[600];
      if (value <= 1) return Colors.green[800];
    }

    generateRow(rowData) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowData.map<Widget>((cellData) {
            String cellValue;
            print(cellData.runtimeType);
            var cellColor;
            if (cellData.runtimeType == String) {
              cellValue = cellData;
            } else if (cellData.runtimeType == double) {
              cellValue = cellData.toString();
              cellColor = generateCellColor(cellData);
              // cellValue = '';
            } else {
              cellColor = Colors.black;
              cellValue = '';
            }

            // Color cellColor;
            // if (cellData.isNotEmpty) {
            //   print(cellData);
            // }

            return Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(width: 0.25, color: Colors.black),
                    right: BorderSide(width: 0.25, color: Colors.black),
                    top: BorderSide(width: 0.25, color: Colors.black),
                    left: BorderSide(width: 0.25, color: Colors.black),
                  ),
                  color: cellColor,
                ),
                width: 30,
                height: 30,
                padding: const EdgeInsets.fromLTRB(1, 5, 1, 0),
                child: Text(
                  cellValue,
                  textAlign: TextAlign.center,
                ));
          }).toList());
    }

    List<Widget> mappedStats = [];
    for (var i = 0; i < matrix.length; i++) {
      mappedStats.add(generateRow(matrix[i]));
    }

    return Container(
        // child: mappedStats;
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                // [
                mappedStats.toList()
            // ]
            ));

    //   ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //       padding: const EdgeInsets.all(8),
    //       itemCount: testMatrix.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Row(
    //           children : [Text(testMatrix[index])]
    //           // height: 50,
    //           // color: Colors.amber[colorCodes[index]],
    //           // child: Center(child: Text(testMatrix[index])),
    //         );
    //       })
    // ]

    // getList(),
    // [
    //   Text('hi'),
    // ]
    // test.toList()
    //        Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: state.dealerHand
    //                   .map<Widget>((card) => CardTemplate(
    //                           cardCode: card.code,
    //                           value: card.value,
    //                           isHoleCard: card.isHoleCard)
    //                       .getWidget())
    //                   .toList())
    //       // BlocBuilder<DeviationsSessionStatsCubit,
    //       //     DeviationsSessionStatsState>(builder: (context, state) {
    //       //   return state.dealerHand
    //       //             .map<Widget>((item) => Text(item)).toList();
    //       // }),
    //       // for(let i = 0; i < matrix.length; i++){

    //       //   matrix.map<Widget>((item) => Text(item)).toList();
    //       // }
    // ]
    //       ),
    // );

    // child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: testMatrix
    //             .map<Widget>((dealerCard) => Container(
    //                 decoration: const BoxDecoration(
    //                   border: Border(
    //                     bottom: BorderSide(width: 1.0, color: Colors.black),
    //                   ),
    //                   color: Colors.white,
    //                 ),
    //                 width: 20,
    //                 padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
    //                 child: Text(
    //                   dealerCard,
    //                   textAlign: TextAlign.center,
    //                 )))
    //             .toList()),
    //   ],
    // ),);

    // return Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       const SizedBox(),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: const <Widget>[
    //           Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
    //           SizedBox(height: 10),
    //           Text('Total:'),
    //           // Text('Hi-Lo:'),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           const Text('Played',
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           const SizedBox(height: 10),
    //           BlocBuilder<DeviationsSessionStatsCubit,
    //               DeviationsSessionStatsState>(builder: (context, state) {
    //             return Text(state.totalPlayed.toString());
    //           }),

    //           // BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
    //           //     builder: (context, state) {
    //           //   return Text(state.hiopt1Played.toString());
    //           // }),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           const Text('Correct',
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           const SizedBox(height: 10),
    //           BlocBuilder<DeviationsSessionStatsCubit,
    //               DeviationsSessionStatsState>(builder: (context, state) {
    //             return Text(state.totalCorrect.toString());
    //           }),
    //           // BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
    //           //     builder: (context, state) {
    //           //   return Text(state.hiloCorrect.toString());
    //           // }),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           const Text('Incorrect',
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           const SizedBox(height: 10),
    //           BlocBuilder<DeviationsSessionStatsCubit,
    //               DeviationsSessionStatsState>(builder: (context, state) {
    //             return Text(state.totalIncorrect.toString());
    //           }),
    //           // BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
    //           //     builder: (context, state) {
    //           //   return Text(state.hiloIncorrect.toString());
    //           // }),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           const Text('Accuracy',
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           const SizedBox(height: 10),
    //           // BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
    //           //     builder: (context, state) {
    //           //   double percentage =
    //           //       (state.correctRuns / state.totalRuns) * 100;
    //           //   if (percentage.isNaN) percentage = 0;
    //           //   return Text(percentage.toStringAsFixed(2) + '%');
    //           // }),
    //           // BlocBuilder<RunningCountSessionStatsCubit, RunningCountSessionStatsState>(
    //           //     builder: (context, state) {
    //           //   double percentage =
    //           //       (state.hiloCorrect /state.hiloPlayed) * 100;
    //           //   if (percentage.isNaN) percentage = 0;
    //           //   return Text(percentage.toStringAsFixed(2) + '%');
    //           // }),
    //         ],
    //       ),
    //       const SizedBox(),
    //     ],
    //   ),
    // );
  }
}
