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
      _checkAchievementToEmit(basicStratgeyAlltimeStatsState);
    });
  }

  void _checkAchievementToEmit(basicStratgeyAlltimeStatsState) {
    int handsPlayed = basicStratgeyAlltimeStatsState.handsPlayed;
    if (handsPlayed == 1) reached1HandsPlayedAchievement();
    if (handsPlayed == 2) reached2HandsPlayedAchievement();
    if (handsPlayed == 3) reached3HandsPlayedAchievement();
    if (handsPlayed == 4) reached4HandsPlayedAchievement();
    if (handsPlayed == 5) reached5HandsPlayedAchievement();
    if (handsPlayed == 6) reached6HandsPlayedAchievement();
    if (handsPlayed == 7) reached7HandsPlayedAchievement();
    if (handsPlayed == 8) reached8HandsPlayedAchievement();
    if (handsPlayed == 9) reached9HandsPlayedAchievement();
  }

  void reached1HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 1,
      bsAchievementText: '1 Basic Strategy Hand Played',
      bsAchievementImagePath: 'assets/images/chips/1_white.png',
    ));
  }

  void reached2HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 2,
      bsAchievementText: '2 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/5_red.png',
    ));
  }

  void reached3HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 3,
      bsAchievementText: '3 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/25_green.png',
    ));
  }

  void reached4HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 4,
      bsAchievementText: '4 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/100_black.png',
    ));
  }

  void reached5HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 5,
      bsAchievementText: '5 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/500_purple.png',
    ));
  }

  void reached6HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 6,
      bsAchievementText: '6 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/1000_orange.png',
    ));
  }


  void reached7HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 7,
      bsAchievementText: '7 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/brown.png',
    ));
  }
  void reached8HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 8,
      bsAchievementText: '8 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/yellow.png',
    ));
  }
  void reached9HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 9,
      bsAchievementText: '9 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/blue.png',
    ));
  }

  @override
  Future<void> close() {
    basicStratgeyAlltimeStatsStreamSubscription.cancel();
    return super.close();
  }
}
