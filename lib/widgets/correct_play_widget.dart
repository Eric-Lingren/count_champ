import 'package:flutter/material.dart';

// Below is how we can pass data from a stafeul widget to a stateless widget:
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
      wasCorrect = 'CORRECT!';
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
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(hand),
              Text(wasCorrect),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const Text('STREAK:'),
              Text('$streak')
            ],
          ),
          Column(children: const [
            Icon(
              Icons.show_chart_outlined,
              color: Colors.black,
              size: 36.0,
            ),
          ])
        ]));
  }
}
