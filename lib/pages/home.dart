import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/test_person.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  void initDataFetch() async {
    // var cardsData = await readJson();
    // var deck = Deck(cardsData);
    // deck.shuffleDeck();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestPerson>(builder: (context, testPerson, child) {
      widget.initDataFetch();

      return (Scaffold(
          body: SafeArea(
              child: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basic_strat_trainer');
              },
              child: Text('Basic Strategy')),
          Text(
              // 'TEST TEXT HERE'
              '''
          Hi ${testPerson.name}!
          You are ${testPerson.age} years old'''),
          ElevatedButton(
            onPressed: () => testPerson.incrementAge(), 
            child: Text('Increase Age'))
        ],
      ))));
    });
  }
}
