import 'dart:ffi';

import 'package:count_champ/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class BasicStratTrainer extends StatefulWidget {
  const BasicStratTrainer({Key? key}) : super(key: key);

  @override
  _BasicStratTrainerState createState() => _BasicStratTrainerState();
}

class _BasicStratTrainerState extends State<BasicStratTrainer> {
  List<String> dealtCards = [];

  @override
  void initState() {
    super.initState();
    dealCards();
  }

  void dealCards() {
    int counter = 0;
    List<String> availableValues = ['2', '3', '4', '5', '6'];
    List<String> availableSuits = ['c', 'd', 'h', 's'];
    List<String> tempCards = [];

    while (counter < 4) {
      String randomValue = (availableValues..shuffle()).first;
      String randomSuit = (availableSuits..shuffle()).first;
      String newCardCode = randomValue + randomSuit;
      tempCards.add(newCardCode);
      counter++;
    }

    setState(() {
      dealtCards = tempCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text('Basic Strategy'),
          centerTitle: true,
          elevation: 0,
          actions: [],
        ),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            CardWidget(cardCode: dealtCards[0]),
            CardWidget(cardCode: dealtCards[1]),
          ]),
          Row(children: <Widget>[
            CardWidget(cardCode: dealtCards[2]),
            CardWidget(cardCode: dealtCards[3]),
          ]),
          Row(children: <Widget>[
            ElevatedButton(
              onPressed: () {
                dealCards();
              },
              child: Text('Deal Cards'),
            ),
          ]),
        ]));
  }
}
