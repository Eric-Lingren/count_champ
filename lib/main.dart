import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:count_champ/logic/cubits/achievements_cubit/bs_achievements_cubit/bs_achievements_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_cubit/basic_strategy_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/alltime/basic_strategy_alltime_stats_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/session/basic_strategy_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/running_count_stats_cubit/alltime/running_count_alltime_stats_cubit.dart';
import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:count_champ/logic/cubits/settings/deviations_settings_cubit/deviations_settings_cubit.dart';
import 'package:count_champ/logic/cubits/deviations_cubit/deviations_cubit.dart';

import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
// import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/alltime/basic_strategy_alltime_stats_cubit.dart';

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
        BlocProvider<CountSettingsCubit>(
            create: (context) => CountSettingsCubit()),
        BlocProvider<BasicStrategyCubit>(
            create: (context) => BasicStrategyCubit()),
        BlocProvider<CountCubit>(
            create: (context) => CountCubit(
                  countSettingsCubit: context.read<CountSettingsCubit>(),
                )),
        BlocProvider<RunningCountSessionStatsCubit>(
            create: (context) => RunningCountSessionStatsCubit(
                countSettingsCubit: context.read<CountSettingsCubit>(),
                countCubit: context.read<CountCubit>())),
        BlocProvider<RunningCountAlltimeStatsCubit>(
            create: (context) => RunningCountAlltimeStatsCubit(
                countSettingsCubit: context.read<CountSettingsCubit>(),
                countCubit: context.read<CountCubit>())),
        BlocProvider<DeckCubit>(
            create: (context) => DeckCubit(
                countCubit: context.read<CountCubit>(),
                countSettingsCubit: context.read<CountSettingsCubit>(),
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
        BlocProvider<BsAchievementsCubit>(
            create: (context) => BsAchievementsCubit(
                basicStratgeyAlltimeStatsCubit:
                    context.read<BasicStrategyAlltimeStatsCubit>())),
        BlocProvider<AchievementsCubit>(
            create: (context) => AchievementsCubit(
                bsAchievementsCubit: context.read<BsAchievementsCubit>())),
        BlocProvider<DeviationsSettingsCubit>(
            create: (context) => DeviationsSettingsCubit()),
        BlocProvider<DeviationsCubit>(
            create: (context) => DeviationsCubit(
                deviationsSettingsCubit:
                    context.read<DeviationsSettingsCubit>())),

        BlocProvider<DeviationsSessionStatsCubit>(
            create: (context) => DeviationsSessionStatsCubit(
                // countSettingsCubit: context.read<DeviationsSettingsCubit>(),
                deviationsCubit: context.read<DeviationsCubit>()
                )),
        // BlocProvider<RunningCountAlltimeStatsCubit>(
        //     create: (context) => RunningCountAlltimeStatsCubit(
        //       countSettingsCubit: context.read<CountSettingsCubit>(),
        //       countCubit: context.read<CountCubit>()
        //     )),
      ],
      child: MaterialApp(
        title: 'Count Champ',
        // initialRoute: '/running_count_trainer',
        // initialRoute: '/achievements',
        initialRoute: '/basic_strategy_trainer',
        // initialRoute: '/deviations_trainer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }
}
