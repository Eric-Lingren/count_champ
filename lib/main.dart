import 'package:count_champ/logic/cubits/basic_strategy_cubit/basic_strategy_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/alltime/basic_strategy_alltime_stats_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/session/basic_strategy_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocDir = await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: appDocDir);

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
  // runApp(MyApp(
  //   appRouter: AppRouter(),
  // ));
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
        BlocProvider<BasicStrategySettingsCubit>(
            create: (context) => BasicStrategySettingsCubit()),
        BlocProvider<BasicStrategyCubit>(
            create: (context) => BasicStrategyCubit()),
        BlocProvider<DeckCubit>(
            create: (context) => DeckCubit(
                basicStrategyCubit: context.read<BasicStrategyCubit>(),
                basicStrategySettingsCubit:
                    context.read<BasicStrategySettingsCubit>())),
        BlocProvider<CorrectPlaysCubit>(
            create: (context) => CorrectPlaysCubit(
                deckCubit: context.read<DeckCubit>(),
                basicStrategySettingsCubit:
                    context.read<BasicStrategySettingsCubit>())),
        BlocProvider<BasicStrategySessionStatsCubit>(
            create: (context) => BasicStrategySessionStatsCubit(
                correctPlaysCubit: context.read<CorrectPlaysCubit>())),
        BlocProvider<BasicStrategyAlltimeStatsCubit>(
            create: (context) => BasicStrategyAlltimeStatsCubit(
                correctPlaysCubit: context.read<CorrectPlaysCubit>())),
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
