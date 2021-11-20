import 'package:count_champ/logic/cubits/basic_strategey_cubit/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/player_cubit/player_cubit.dart';
import 'package:count_champ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'logic/cubits/game_settings_cubit/game_settings_cubit.dart';



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
      BlocProvider<GameSettingsCubit>(
            create: (context) => GameSettingsCubit()),
      // BlocProvider<CorrectPlaysCubit>(
      //       create: (context) => CorrectPlaysCubit()),
      BlocProvider<BasicStrategeyCubit>(
            create: (context) => BasicStrategeyCubit()),
        BlocProvider<DeckCubit>(
            create: (context) => DeckCubit(
              basicStrategeyCubit: context.read<BasicStrategeyCubit>(), 
              gameSettingsCubit: context.read<GameSettingsCubit>())),
      BlocProvider<CorrectPlaysCubit>(
            create: (context) => CorrectPlaysCubit(deckCubit: context.read<DeckCubit>(), gameSettingsCubit: context.read<GameSettingsCubit>())),
        BlocProvider<PlayerCubit>(
            create: (context) => PlayerCubit()),
      ],
      child: MaterialApp(
        title: 'Count Champ',
        initialRoute: '/basic_strategy_trainer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }
}
