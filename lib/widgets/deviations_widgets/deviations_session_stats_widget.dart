import 'dart:convert';

import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
import 'package:count_champ/widgets/count_widgets/count_info_popup_widget.dart';
import 'package:count_champ/widgets/global_widgets/stats_details_popup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api/expect.dart';

class DeviationsSessionStats extends StatelessWidget {
  const DeviationsSessionStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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

    generateRow(rowData, playerHand, dealerRow) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowData.asMap().entries.map<Widget>((cellData) {
            var index = cellData.key;
            var data = cellData.value;
            var cellValue = '';
            var cellColor;
            
            if (data.isNotEmpty) {
              if (data.runtimeType == String) {
                // This is a column or row heading
                cellValue = data;
              } else if (data['percentage'].runtimeType == double) {
                // This is a valid percentage value
                cellValue = '';
                cellColor = generateCellColor(data['percentage']);
              } else if (data['percentage'] == null) {
                // This is an int value and unused
                cellColor = Colors.black;
                cellValue = '';
              }
            }

            return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatsDetailsPopupWidget(
                        statsData: data,
                        playerHand: playerHand,
                        dealerHand: dealerRow[index],
                      );
                    });
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(width: 1.0, color: Colors.white),
                        right: BorderSide(width: 1.0, color: Colors.white),
                        top: BorderSide(width: 1.0, color: Colors.white),
                        left: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      color: cellColor,
                    ),
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.fromLTRB(1, 5, 1, 0),
                    child: Text(
                      cellValue,
                      textAlign: TextAlign.center,
                    )));
          }).toList());
    }

    _getMappedStats(matrix) {
      List<Widget> mappedStats = [];

      var matrixData = List.from(matrix);
      // var matrixData = List.from(matrix.reversed);

      for (var i = 0; i < matrixData.length; i++) {
        var rowIndex = i;
        var playerHand = matrixData[rowIndex][0];
        // print(playerHand);

        var dealerRow = matrixData[0];
        // print(dealerRow);

        mappedStats
            .add(generateRow(matrixData[rowIndex], playerHand, dealerRow));
      }
      return mappedStats.toList();
    }

    return BlocBuilder<DeviationsSessionStatsCubit,
            DeviationsSessionStatsState>(
        builder: (deviationsContext, deviationsState) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _getMappedStats(deviationsState.deviationsStatsMatrix));
    });
  }
}
