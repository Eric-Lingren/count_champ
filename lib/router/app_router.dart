import 'package:count_champ/pages/basic_strategey_stats.dart';
import 'package:count_champ/pages/basic_strategey_trainer.dart';
import 'package:count_champ/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/basic_strategy_trainer':
        return MaterialPageRoute(builder: (_) => const BasicStrategeyTrainer());
      case '/basic_strategy_stats':
        return MaterialPageRoute(builder: (_) => const BasicStrategeyStats());
      default:
        return null;
    }
  }

}