import 'package:count_champ/models/trainers/basic_strategey/basic_strategey.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/pages/home.dart';
import 'package:count_champ/pages/loading.dart';
import 'package:count_champ/pages/basic_strat_trainer.dart';
import 'package:provider/provider.dart';

import 'models/deck/deck.dart';
import 'models/person/player.dart';
import 'models/test_person.dart';

void main() => runApp(
  MultiProvider(
      providers: [
        ListenableProvider<TestPerson>(create: (context) => TestPerson()),
        ListenableProvider<Deck>(create: (context) => Deck()),
        ListenableProvider<BasicStrategey>(create: (context) => BasicStrategey()),
        ListenableProvider<Player>(create: (context) => Player()),
        // ListenableProvider<TestPerson>(create: (context) => TestPerson(name: 'Buddy', age: 25)),
        // FutureProvider<String>(create: (context) => Home().fetchAddress),
      ],
  // ChangeNotifierProvider(
  //   create: (_) => TestPerson(name: "Buddy Man Guy", age: 25),
    child: MaterialApp(
      // initialRoute: '/home', // For defaulting to a route for faster dev time
      // initialRoute: '/', // For defaulting to a route for faster dev time
      initialRoute: '/basic_strat_trainer', // For defaulting to a route for faster dev time
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/basic_strat_trainer': (context) => BasicStratTrainer(),
        }
    ),
  )
);

