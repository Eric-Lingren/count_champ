import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpChartWidget extends StatelessWidget {
  final chartMatrix;
  final title;

  const HelpChartWidget({
    Key? key,
    required this.chartMatrix,
    required this.title,
  }) : super(key: key);

  generateRow(rowData, rowIndex) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowData.asMap().entries.map<Widget>((cellData) {
          var index = cellData.key;
          var data = Map<String, dynamic>.from(cellData.value);

          Color borderColor = Colors.white;
          var cellTextColor;
          var cellTextWeight = FontWeight.normal;
          double borderBottomWidth = 2.0;
          double borderRightWidth = 2.0;
          double borderTopWidth = 0.0;
          double borderLeftWidth = 0.0;
          var cellValue = '';
          var cellColor;
          double cellFontSize = 12;
          double cellWidth = 20;

          if (index == 0) {
            borderLeftWidth = 2;
            cellWidth = 40;
          }
          if (rowIndex == 0) {
            borderTopWidth = 2;
          }

          if (data.containsKey('heading')) {
            cellValue = data['heading'];
            cellColor = Colors.white;
          } else if (data.containsKey('deviation') &&
              data['deviation'] != null) {
            cellValue = data['deviation'].toString();
            cellColor = Colors.black;
            cellTextColor = Colors.white;
            // cellTextWeight = FontWeight.bold;
          } else {
            String play = data['play'];
            cellValue = play;
            if (play == 'S') {
              cellColor = Colors.yellowAccent[400];
            } else if (play == 'H') {
              cellTextColor = Colors.white;
              cellColor = Colors.redAccent[400];
            } else if (play == 'P') {
              cellColor = Colors.greenAccent[400];
            } else if (play.contains('R')) {
              cellColor = Colors.white;
            } else if (play.contains('D')) {
              cellTextColor = Colors.white;
              cellColor = Colors.blueAccent[400];
            }
          }

          if (cellValue.contains('/')) cellFontSize = 10;

          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: borderBottomWidth, color: borderColor),
                  right:
                      BorderSide(width: borderRightWidth, color: borderColor),
                  top: BorderSide(width: borderTopWidth, color: borderColor),
                  left: BorderSide(width: borderLeftWidth, color: borderColor),
                ),
                color: cellColor,
              ),
              width: cellWidth,
              height: 20,
              padding: const EdgeInsets.fromLTRB(1, 1, 1, 0),
              child: Text(
                cellValue,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: cellTextColor,
                  fontWeight: cellTextWeight,
                  fontSize: cellFontSize,
                ),
              ));
        }).toList());
  }

  _getMappedChart() {
    List<Widget> mappedChart = [];
    var matrixData = List.from(chartMatrix.reversed);
    for (var i = 0; i < matrixData.length; i++) {
      var rowIndex = i;
      mappedChart.add(generateRow(matrixData[rowIndex], rowIndex));
    }
    return mappedChart;
  }

  @override
  Widget build(BuildContext context) {
    var _index = 0;

    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
            width: 600,
            height: 400,
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue[600],
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [..._getMappedChart()],
                ),
                // Expanded(
                //   child: PageView.builder(
                //     itemCount: 3,
                //     controller: PageController(viewportFraction: 1),
                //     onPageChanged: (int index) => (() => _index = index),
                //     itemBuilder: (_, i) {
                //       return Transform.scale(
                //         scale: 0.9,
                //         child: Card(
                //           elevation: 6,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20)),
                //           child: Column(
                //             children: [..._getMappedChart()],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            )));
  }
}
