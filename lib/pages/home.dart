import 'package:count_champ/models/deck/deck.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  test(){
    // var cardsData = await readJson();
    // var deck = Deck(cardsData);
    // deck.shuffleDeck();
    print('Test Ran');
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


      return (Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/basic_strat_trainer');
                },
                child: Text('Basic Strategy')),
              
            ],
      ))));
    }
}
