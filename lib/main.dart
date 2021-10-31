import 'package:flutter/material.dart';
import 'package:count_champ/pages/home.dart';
import 'package:count_champ/pages/loading.dart';
import 'package:count_champ/pages/basic_strat_trainer.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/basic_strat_trainer', // For defualting to a route for faster dev time
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/basic_strat_trainer': (context) => BasicStratTrainer(),
    }
  ));

