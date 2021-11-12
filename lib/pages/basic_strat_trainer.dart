import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/person/dealer.dart';
import 'package:count_champ/models/person/person.dart';
import 'package:count_champ/models/person/player.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:count_champ/models/trainers/basic_strategey/basic_strategey.dart';
import 'package:count_champ/models/trainers/correct_plays/correct_plays.dart';
import 'package:count_champ/utils/services/service_locator.dart';
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
  var person;
  bool isSettingsOpen = false;

  @override
  void initState() {
    super.initState();
    deck = getIt.get<Deck>();
    deck.initDeckData();
    

    // This like a useEffect to import the consumer on mount rather than on render
    // WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
    //   deck = getIt.get<Deck>();
    //   deck.initDeckData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // var dealer = getIt.get<Dealer>();
    print(deck.currentDealerHand);
    return Consumer<BasicStrategey>(builder: (context, basicStrategey, child) {
      return Scaffold(
          backgroundColor: Colors.green[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[850],
            title: Text('Basic Strategy'),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(children: <Widget>[
            Row(
                children: basicStrategey.dealerHand
                    .map<Widget>((card) => CardTemplate(
                            cardCode: card.code,
                            value: card.value,
                            isHoleCard: card.isHoleCard)
                        .getWidget())
                    .toList()),
            Row(
                children: basicStrategey.playerHand
                    .map<Widget>((card) => CardTemplate(
                            cardCode: card.code,
                            value: card.value,
                            isHoleCard: card.isHoleCard)
                        .getWidget())
                    .toList()),
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
                  basicStrategey.dealNewHand();
                },
                child: Text('Deal New Hand'),
              ),
              ElevatedButton(
                onPressed: () {
                  // player.showStartingHand();
                  // CorrectPlays.checkPlay('none');
                  // correctPlays.checkPlay('none');
                  // basicStrategey.checkBsPlay('none');
                  // basicStrategey.checkPlayerHand();
                },
                child: Text('Test Button'),
              ),
            ]),
            Row(children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // gameSettings.setDas(!gameSettings.canDAS);
                  basicStrategey.bsSetRule();
                },
                child: Text('Change Rule'),
              ),
              ElevatedButton(
                onPressed: () {
                  // gameSettings.showGameSettingsRule();
                  basicStrategey.bsShowRule();
                },
                child: Text('Show Game Rule'),
              ),
            ]),
          ]));
    });
  }
}
