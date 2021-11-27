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
    if (handsPlayed == 5) reached5HandsPlayedAchievement();
    if (handsPlayed == 10) reached10HandsPlayedAchievement();
    if (handsPlayed == 15) reached15HandsPlayedAchievement();
    if (handsPlayed == 20) reached20HandsPlayedAchievement();
    if (handsPlayed == 25) reached25HandsPlayedAchievement();
    if (handsPlayed == 30) reached30HandsPlayedAchievement();
    if (handsPlayed == 35) reached35HandsPlayedAchievement();
    if (handsPlayed == 40) reached40HandsPlayedAchievement();
  }

  void reached1HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 1,
      bsAchievementText: '1 Basic Strategy Hand Played',
      bsAchievementImagePath: 'assets/images/chips/1_white.png',
    ));
  }

  void reached5HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 5,
      bsAchievementText: '5 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/5_red.png',
    ));
  }

  void reached10HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 10,
      bsAchievementText: '10 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/25_green.png',
    ));
  }

  void reached15HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 15,
      bsAchievementText: '15 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/100_black.png',
    ));
  }

  void reached20HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 20,
      bsAchievementText: '20 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/500_purple.png',
    ));
  }

  void reached25HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 25,
      bsAchievementText: '25 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/1000_orange.png',
    ));
  }


  void reached30HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 30,
      bsAchievementText: '30 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/brown.png',
    ));
  }
  void reached35HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 35,
      bsAchievementText: '35 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/yellow.png',
    ));
  }
  void reached40HandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: 40,
      bsAchievementText: '40 Basic Strategy Hands Played',
      bsAchievementImagePath: 'assets/images/chips/blue.png',
    ));
  }

  @override
  Future<void> close() {
    basicStratgeyAlltimeStatsStreamSubscription.cancel();
    return super.close();
  }
}
