import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsDetailsPopupWidget extends StatelessWidget {
  final statsData;
  final playerHand;
  final dealerHand;

  const StatsDetailsPopupWidget(
      {Key? key,
      required this.statsData,
      required this.playerHand,
      required this.dealerHand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    _getStatsText() {
      if (statsData['percentage'] == null) {
        return const Text(
          'No Valid Deviation',
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        );
      } else {
        // var test = statsData['percentage'].toString();
        return Column(children: [
          Text(
            '${(statsData['percentage']*100).toStringAsFixed(2)}%',
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox( height: 20),
          Text(
            'Played: ${statsData['played'].toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox( height: 5),
          Text(
            'Correct: ${statsData['correct'].toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ]);
      }
    }

    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue[600],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Player: $playerHand',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Dealer: $dealerHand',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox( height: 10),
                _getStatsText()
              ],
            )));
  }
}
