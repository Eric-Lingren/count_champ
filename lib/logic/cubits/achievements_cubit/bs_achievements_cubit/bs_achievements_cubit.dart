import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/alltime/basic_strategy_alltime_stats_cubit.dart';
import 'package:equatable/equatable.dart';

part 'bs_achievements_state.dart';

class BsAchievementsCubit extends Cubit<BsAchievementsState> {
  final BasicStrategyAlltimeStatsCubit basicStratgeyAlltimeStatsCubit;
  late StreamSubscription basicStratgeyAlltimeStatsStreamSubscription;

  BsAchievementsCubit({
    required this.basicStratgeyAlltimeStatsCubit,
    basicStratgeyAlltimeStatsStreamSubscription,
  }) : super(BsAchievementsState()) {
    _monitorBasicStratgeyAlltimeStatsCubit();
  }

  StreamSubscription<BasicStrategyAlltimeStatsState>
      _monitorBasicStratgeyAlltimeStatsCubit() {
    return basicStratgeyAlltimeStatsStreamSubscription =
        basicStratgeyAlltimeStatsCubit.stream
            .listen((basicStratgeyAlltimeStatsState) {
      // int handsPlayed = basicStratgeyAlltimeStatsState.handsPlayed;
      // print('bs alltime stats stream sub in BS Achievements');
      // if (handsPlayed == 1) reached1HandsPlayedAchievement();
      // if (handsPlayed == 5) reached5HandsPlayedAchievement();
      _checkAchievementToEmit(basicStratgeyAlltimeStatsState);
    });
  }

  void _checkAchievementToEmit(basicStratgeyAlltimeStatsState){
    int handsPlayed = basicStratgeyAlltimeStatsState.handsPlayed;
    if (handsPlayed == 1) reached1HandsPlayedAchievement();
    if (handsPlayed == 5) reached5HandsPlayedAchievement();

  }

  void reached1HandsPlayedAchievement() {
    print('reached 1');
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 1,
    ));
  }

  void reached5HandsPlayedAchievement() {
    print('reached 5');
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 5,
    ));
  }

  @override
  Future<void> close() {
    basicStratgeyAlltimeStatsStreamSubscription.cancel();
    return super.close();
  }
}
