import 'package:flutter/material.dart';

class PlayingCard extends StatefulWidget {
  const PlayingCard({ Key? key }) : super(key: key);

  @override
  _PlayingCardState createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage('https://deckofcardsapi.com/static/img/6C.png'),
    );
  }
}
