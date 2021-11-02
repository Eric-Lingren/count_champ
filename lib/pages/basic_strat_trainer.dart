import 'dart:ffi';

import 'package:count_champ/models/card_template.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/person/player.dart';
import 'package:count_champ/models/trainers/basic_strategey/basic_strategey.dart';
import 'package:count_champ/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicStratTrainer extends StatefulWidget {
  const BasicStratTrainer({Key? key}) : super(key: key);

  @override
  _BasicStratTrainerState createState() => _BasicStratTrainerState();
}

class _BasicStratTrainerState extends State<BasicStratTrainer> {
  List<String> dealtCards = [];
  var deck;

  @override
  void initState() {
    super.initState();
    dealCards();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   auth = Provider.of<Auth>(context, listen: false);
    // });
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      deck = context.read<Deck>();
      deck.initDeckData();
      // deck.shuffleDeck();
    });
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
    // CardTemplate(cardCode: dealtCards[0]).getWidget();
  }

  @override
  Widget build(BuildContext context) {
    // var player = Player();

    return Consumer<BasicStrategey>(builder: (context, basicStrategey, child) {
      return Consumer<Player>(builder: (context, player, child) {
        // basicStrategey.initDeckData();
        // basicStrategey.shuffleDeck();
        // if (deck != null) print(deck.dealtCards.length);

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
              // if (deck != null)
              //   Row(children: <Widget>[
              //     CardTemplate(cardCode: deck.dealtCards[-1]).getWidget(),
              //     CardTemplate(cardCode: deck.dealtCards[-2]).getWidget(),
              //   ]),
              // if (deck != null)
              Row(children: <Widget>[
                player.hands[player.hands.length - 1].getWidget()

                // player.hands[-1].getWidget(),
                // player.hands.last().getWidget()
                // CardTemplate(cardCode: player.hands.last().code).getWidget(),
                // CardTemplate(cardCode: deck.dealtCards[-2]).getWidget(),
              ]),
              // Row(children: <Widget>[
              //   CardTemplate(cardCode: dealtCards[2]).getWidget(),
              //   CardTemplate(cardCode: dealtCards[3]).getWidget(),
              // ]),
              Row(children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    dealCards();
                  },
                  child: Text('Deal Cards Locally'),
                ),
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.dealStartingHand();
                    // deck.initDeckData();
                  },
                  child: Text('Deal Starting Hand'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.hit();
                    // deck.initDeckData();
                  },
                  child: Text('Hit'),
                ),
              ]),
            ]));
      });
    });
  }
}
