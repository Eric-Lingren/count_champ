// import 'dart:js';

import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/player_cubit/player_cubit.dart';
import 'package:count_champ/models/test_proxies/dgreet.dart';
import 'package:count_champ/models/test_proxies/greet.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:count_champ/models/trainers/basic_strategey/basic_strategey.dart';
import 'package:count_champ/models/trainers/correct_plays/correct_plays.dart';
import 'package:count_champ/pages/home.dart';
import 'package:count_champ/pages/test_proxy_provider_page.dart';
import 'package:count_champ/router/app_router.dart';
import 'package:count_champ/utils/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/pages/loading.dart';
import 'package:count_champ/pages/basic_strat_trainer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'models/deck/deck.dart';
import 'models/person/player.dart';

// void main() => {
//   setupServices(), // Imports providers
//     runApp(MultiProvider(
//       // More Providers
//       providers: [
//         ListenableProvider<BasicStrategey>(
//             create: (context) => BasicStrategey()),
//       ],
//       child: MaterialApp(
//         // Change Initial route for faster dev time
//         // Production should default to / for the loader
//         // initialRoute: '/',
//         initialRoute: '/home',
//         // initialRoute: '/basic_strat_trainer',
//         // initialRoute: '/test_proxy_provider_page',
//         routes: {
//           '/': (context) => Loading(),
//           '/home': (context) => Home(),
//           '/basic_strat_trainer': (context) => BasicStratTrainer(),
//           '/test_proxy_provider_page': (context) => TestProxyProviderPage(),
//         },
//       ),
//     ))
//   };

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeckCubit>(
            create: (context) => DeckCubit()),
        BlocProvider<PlayerCubit>(
            create: (context) => PlayerCubit()),
                // DeckCubit(deckRepository: DeckRepositoryImpl())),
        // BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }
}
