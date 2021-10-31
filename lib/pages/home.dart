import 'package:count_champ/models/person/dealer_template.dart';
import 'package:count_champ/models/person/player_template.dart';
import 'package:count_champ/models/deck/deck_template.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  void initDataFetch() async {
    var cardsData = await readJson();
    var deck = Deck(cardsData);
    deck.shuffleDeck();
    // Deck.generateDeck();
    // print(cardsData[5].image);
    var player = Player();
    var dealer = Dealer();
    print('dealer :');
    dealer.hit();
    dealer.checkHoleCard();
    print(dealer.bankroll);
    print('player :');
    player.hit();
    player.double();
    print(player.bankroll);
    // player.checkHoleCard();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    widget.initDataFetch();

    return (Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basic_strat_trainer');
            },
            child: Text('Basic Strategy'))
      ],
    ))));
  }
}
