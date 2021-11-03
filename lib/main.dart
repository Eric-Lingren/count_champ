// import 'dart:js';

import 'package:count_champ/models/test_proxies/dgreet.dart';
import 'package:count_champ/models/test_proxies/greet.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:count_champ/models/trainers/basic_strategey/basic_strategey.dart';
import 'package:count_champ/pages/test_proxy_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/pages/home.dart';
import 'package:count_champ/pages/loading.dart';
import 'package:count_champ/pages/basic_strat_trainer.dart';
import 'package:provider/provider.dart';
import 'models/deck/deck.dart';
import 'models/person/player.dart';

void main() => runApp(MultiProvider(
      // providers : providers,
      providers: [
        ListenableProvider<Deck>(create: (context) => Deck()),
        ListenableProvider<BasicStrategey>(create: (context) => BasicStrategey()),
        ListenableProvider<Player>(create: (context) => Player()),
        ListenableProvider<GameSettings>(create: (context) => GameSettings()),

        ListenableProvider<Greet>(create: (context) => Greet()),
        ProxyProvider<Greet, Dgreet>(update: (context, myGreet, anotherModal) => Dgreet(myGreet)),
      ],
      child: MaterialApp(
          // initialRoute: '/home', // For defaulting to a route for faster dev time
          // initialRoute: '/', // For defaulting to a route for faster dev time
          initialRoute: '/basic_strat_trainer', // For defaulting to a route for faster dev time
          // initialRoute: '/test_proxy_provider_page', // For defaulting to a route for faster dev time
          routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/basic_strat_trainer': (context) => BasicStratTrainer(),
            '/test_proxy_provider_page': (context) => TestProxyProviderPage(),
          },
          ),
    ));