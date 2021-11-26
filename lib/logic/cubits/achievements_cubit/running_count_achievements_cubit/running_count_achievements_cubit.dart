// import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'running_count_achievements_state.dart';

class RunningCountAchievementsCubit extends Cubit<RunningCountAchievementsState> {
  // final CountSettingsCubit countSettingsCubit;
  // late StreamSubscription countSettingsStreamSubscription;

  RunningCountAchievementsCubit(
    // {
    // required this.countSettingsCubit,
    // countSettingsStreamSubscription,
  // }
  ) : super(RunningCountAchievementsState(didCheckResult: false,)){
    // _monitorCountSettingsCubit();
  }

  // StreamSubscription<CountSettingsState> _monitorCountSettingsCubit() {
  //   return countSettingsStreamSubscription =
  //       countSettingsCubit.stream.listen((countSettingsState) {
  //     resetCheckRunningCount();
  //   });
  // }



  // void resetCheckRunningCount() {
  //   emit(CountState(didCheckResult: false, wasPlayerCountCorrect: false));
  // }

  // @override
  // Future<void> close() {
  //   basicStratgeyAlltimeStatsStreamSubscription.cancel();
  //   return super.close();
  // }

}
