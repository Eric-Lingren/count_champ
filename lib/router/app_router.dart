import 'package:count_champ/pages/basic_strategy_stats.dart';
import 'package:count_champ/pages/basic_strategy_trainer.dart';
import 'package:count_champ/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/basic_strategy_trainer':
        return MaterialPageRoute(builder: (_) => const BasicStrategyTrainer());
      case '/basic_strategy_stats':
        return MaterialPageRoute(builder: (_) => const BasicStrategyStats());
      default:
        return null;
    }
  }

}