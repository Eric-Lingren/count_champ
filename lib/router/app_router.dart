import 'package:count_champ/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



// For Global Routing with one provider passed to Every Page via the MaterialApp:
class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Home());
        break;
      // case '/second':
      //   return MaterialPageRoute(
      //       builder: (_) => SecondScreen(
      //           title: 'Second Page', color: Colors.redAccent));
      //   break;
      // case '/third':
      //   return MaterialPageRoute(
      //       builder: (_) => ThirdScreen(
      //           title: 'Third Page', color: Colors.greenAccent));
      //   break;
      default:
        return null;
    }
  }

}