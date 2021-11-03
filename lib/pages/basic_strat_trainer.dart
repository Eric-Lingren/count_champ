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

    // This like a useEffect to import the consumer on mount rather than on render
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      deck = context.read<Deck>();
      deck.initDeckData();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<BasicStrategey>(builder: (context, basicStrategey, child) {
      return Consumer<Player>(builder: (context, player, child) {

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
              Row(
                children: basicStrategey.currentDealerHand.map<Widget>((card)=>CardTemplate(cardCode: card.code, value: card.value, isHoleCard: card.isHoleCard).getWidget()).toList()
              ),
              Row(
                children: basicStrategey.currentPlayerHand.map<Widget>((card)=>CardTemplate(cardCode: card.code, value: card.value, isHoleCard: card.isHoleCard).getWidget()).toList()
              ),
              Row(children: <Widget>[
                
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.hit();
                  },
                  child: Text('Hit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.stand();
                  },
                  child: Text('Stand'),
                ),
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.double();
                  },
                  child: Text('Double'),
                ),
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.split();
                  },
                  child: Text('Split'),
                ),
              ]),
              Row(children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    basicStrategey.initNewHand();
                  },
                  child: Text('Deal New Hand'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // player.showStartingHand();
                    basicStrategey.checkPlay('none');
                  },
                  child: Text('Check Play'),
                ),
              ]),
            ]));
      });
    });
  }
}
