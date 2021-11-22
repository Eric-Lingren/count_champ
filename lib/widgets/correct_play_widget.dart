import 'package:flutter/material.dart';

class CorrectPlayWidget extends StatelessWidget {
  final bool playWasCorrect;
  final String correctPlay;
  final String hand;
  final int streak;


  const CorrectPlayWidget({
    Key? key,
    required this.playWasCorrect,
    required this.correctPlay,
    required this.hand,
    required this.streak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String wasCorrect = '';
    Color? backgroundColor;

    if (playWasCorrect == true) {
      backgroundColor = Colors.green[300];
    } else if (playWasCorrect == false) {
      wasCorrect = 'Correct Play Was: '+ correctPlay.toUpperCase();
      backgroundColor = Colors.red[200];
    } else {
      wasCorrect = 'ERROR - Something Broke';
      backgroundColor = Colors.purple;
    }

    return Container(
        color: backgroundColor,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Last Hand - '+ hand),
                  Text(wasCorrect),
                ],
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const Text('Streak:'),
              Text('$streak')
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Column(children: [
              IconButton(
                icon: Icon(Icons.show_chart_outlined,
                color: Colors.black,
                size: 36.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/basic_strategy_stats');
                },
              ),
            ]),
          )
        ]));
  }
}
