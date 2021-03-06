import 'package:count_champ/pages/achievements_page.dart';
import 'package:count_champ/pages/basic_strategy_stats.dart';
import 'package:count_champ/pages/basic_strategy_trainer.dart';
import 'package:count_champ/pages/running_count_stats.dart';
import 'package:count_champ/pages/running_count_trainer.dart';
import 'package:count_champ/pages/deviations_trainer.dart';
import 'package:count_champ/pages/deviations_stats.dart';
import 'package:count_champ/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/achievements':
        return MaterialPageRoute(builder: (_) => const AchievementsPage());
      case '/basic_strategy_trainer':
        return MaterialPageRoute(builder: (_) => const BasicStrategyTrainer());
      case '/basic_strategy_stats':
        return MaterialPageRoute(builder: (_) => const BasicStrategyStats());
      case '/running_count_trainer':
        return MaterialPageRoute(builder: (_) => const RunningCountTrainer());
      case '/running_count_stats':
        return MaterialPageRoute(builder: (_) => const RunningCountStats());
      case '/deviations_trainer':
        return MaterialPageRoute(builder: (_) => const DeviationsTrainer());
      case '/deviations_stats':
        return MaterialPageRoute(builder: (_) => const DeviationsStats());
      default:
        return null;
    }
  }

}