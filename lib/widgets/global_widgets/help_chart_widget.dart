import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpChartWidget extends StatelessWidget {
  final chartMatrix;
  final title;

  // final playerHand;
  // final dealerHand;

  const HelpChartWidget({
    Key? key,
    required this.chartMatrix,
    required this.title,
    // required this.statsData,
    // required this.playerHand,
    // required this.dealerHand
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

          if (index == 0) {
            borderLeftWidth = 2;
          }
          if (rowIndex == 0) {
            borderTopWidth = 2;
          }

          if (data.containsKey('heading')) {
            // print('heading');
            // print(data['heading']);
            cellValue = data['heading'];
            cellColor = Colors.white;
          } else if (data.containsKey('deviation') &&
              data['deviation'] != null) {
            cellValue = data['deviation'].toString();
            cellColor = Colors.black;
            cellTextColor = Colors.white;
            cellTextWeight = FontWeight.bold;
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
              width: 25,
              height: 25,
              padding: const EdgeInsets.fromLTRB(1, 4, 1, 0),
              child: Text(
                cellValue,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: cellTextColor,
                  fontWeight: cellTextWeight,
                ),
              ));
        }).toList());
  }

  _getMappedChart() {
    List<Widget> mappedChart = [];
    // var matrixData = List.from(chartMatrix);
    var matrixData = List.from(chartMatrix.reversed);
    for (var i = 0; i < matrixData.length; i++) {
      // print(matrixData[i]);
      var rowIndex = i;
      // var playerHand = matrixData[rowIndex][0];
      // var dealerRow = matrixData[0];
      mappedChart.add(generateRow(matrixData[rowIndex], rowIndex));
    }
    return mappedChart;
  }

  @override
  Widget build(BuildContext context) {
    var _index = 0;

    print(_index);
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
            // width: double.infinity,
            width: 500,
            height: 500,
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
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Hard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationThickness: 10,
                      ),
                    ),
                    const Text(
                      'Soft',
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                        right: 10,
                        left: 10,
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.white, // Text colour here
                        width: 2.0, // Underline width
                      ))),
                      child: const Text(
                        "Split",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // Text colour here
                        ),
                      ),
                    )
                  ],
                ),
                

                Expanded(
                  child: PageView.builder(
                    itemCount: 3,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (int index) => (() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        // scale: i == _index ? 1 : 0.9,
                        scale: 0.9,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [..._getMappedChart()],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
            // ],)

            // ],),
            // ])
            // PageView.builder(
            //   itemCount: 3,
            //   // controller: PageController(viewportFraction: 0.7),
            //   onPageChanged: (int index) => (() => _index = index),
            //   itemBuilder: (_, i) {
            //     return Transform.scale(
            //       // scale: i == _index ? 1 : 0.9,
            //       scale: 0.9,
            //       child: Card(
            //         elevation: 6,
            //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //         child: Column(
            //           children: [..._getMappedChart()],
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // ],)

            //       preferredSize: Size.fromHeight(30.0)),
            //   actions: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.only(right: 16.0),
            //       child: Icon(Icons.add_alert),
            //     ),
            //   ],
            // ),
            // Column(mainAxisSize: MainAxisSize.min, children: [
            //   Text(title,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontSize: 26,
            //   ),),
            //   Text('yo'),
            //   Text('yo'),
            //   ..._getMappedChart()
            // ])
            ));
  }
}
