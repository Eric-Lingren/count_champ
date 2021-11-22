import 'package:count_champ/logic/cubits/basic_strategey_cubit/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategey_settings_cubit/basic_strategey_settings_cubit.dart';
import 'package:count_champ/logic/cubits/cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
      BlocProvider<BasicStrategeySettingsCubit>(
            create: (context) => BasicStrategeySettingsCubit()),
      BlocProvider<BasicStrategeyCubit>(
            create: (context) => BasicStrategeyCubit()),
        BlocProvider<DeckCubit>(
            create: (context) => DeckCubit(
              basicStrategeyCubit: context.read<BasicStrategeyCubit>(), 
              basicStrategeySettingsCubit: context.read<BasicStrategeySettingsCubit>())),
      BlocProvider<CorrectPlaysCubit>(
            create: (context) => CorrectPlaysCubit(deckCubit: context.read<DeckCubit>(), basicStrategeySettingsCubit: context.read<BasicStrategeySettingsCubit>())),
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
