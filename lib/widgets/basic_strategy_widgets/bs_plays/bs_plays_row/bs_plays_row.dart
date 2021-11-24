import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BsPlaysRow extends StatelessWidget {
  // final int playerTotal;
  // final List bsPlays;
  // final List bsPlays = [];
  // final List plays = ['split', 'split', 'split', 'split', 'split', 'split', 'split', 'hit', 'hit', 'hit' ];
  final List dealerList = ['2', '3', '4', '5', '6', '7', '8', '9', '10', '11'];
  // final int playerTotal = 16;
  final String dealerText = 'Dealer';
  final Color? hitColor = Colors.red[300];
  final Color? standColor = Colors.amber[300];
  final Color? doubleColor = Colors.blue[300];
  final Color? splitColor = Colors.greenAccent[400];
  final Color surrenderColor = Colors.white;

  var bsPlays;

  BsPlaysRow({
    Key? key,
    required this.bsPlays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List outputPlays = [];
    for (int i = 0; i < bsPlays.length; i++) {
      List tempSubList = [];
      if (bsPlays[i] == 'hit') tempSubList = ['H', hitColor];
      if (bsPlays[i] == 'stand') tempSubList = ['S', standColor];
      if (bsPlays[i] == 'double') tempSubList = ['D', doubleColor];
      if (bsPlays[i] == 'split') tempSubList = ['P', splitColor];
      if (bsPlays[i] == 'surrender') tempSubList = ['R', surrenderColor];
      outputPlays.add(tempSubList);
    }

    return Row(
        children: outputPlays
            .map<Widget>((card) => Container(
                color: card[1],
                width: 20,
                padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                child: Text(
                  card[0],
                  textAlign: TextAlign.center,
                )))
            .toList());
  }
}
