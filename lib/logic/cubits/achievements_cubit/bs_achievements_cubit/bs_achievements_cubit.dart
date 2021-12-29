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

  //* Achievements images order :
  // 'assets/images/chips/1_white.png',
  // 'assets/images/chips/5_red.png',
  // 'assets/images/chips/25_green.png',
  // 'assets/images/chips/100_black.png',
  // 'assets/images/chips/500_purple.png',
  // 'assets/images/chips/1000_orange.png',
  // 'assets/images/chips/5000_grey.png',

  void _checkAchievementToEmit(basicStratgeyAlltimeStatsState) {
    print('running emit achieve');
    print(basicStratgeyAlltimeStatsState);
    int handsPlayed = basicStratgeyAlltimeStatsState.handsPlayed;
    if (handsPlayed == 0) resetHandsPlayedAchievement();
    if (handsPlayed == 10) {
      totalBsHandsPlayedAchievement(10, '1_white.png');
    }
    if (handsPlayed == 50) {
      totalBsHandsPlayedAchievement(50, '5_red.png');
    }
    if (handsPlayed == 250) {
      totalBsHandsPlayedAchievement(250, '25_green.png');
    }
    if (handsPlayed == 500) {
      totalBsHandsPlayedAchievement(500, '100_black.png');
    }
    if (handsPlayed == 1000) {
      totalBsHandsPlayedAchievement(1000, '500_purple.png');
    }
    if (handsPlayed == 5000) {
      totalBsHandsPlayedAchievement(5000, '1000_orange.png');
    }
    if (handsPlayed == 10000) {
      totalBsHandsPlayedAchievement(10000, '5000_grey.png');
    }
  }

  void resetHandsPlayedAchievement() {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: -1,
      bsAchievementText: '',
      bsAchievementImagePath: '',
    ));
  }

  void totalBsHandsPlayedAchievement(count, image) {
    emit(BsAchievementsState(
      bsTotalPlayedAchievement: count,
      bsAchievementText: count.toString() + ' Basic Strategy Hand Played',
      bsAchievementImagePath: 'assets/images/chips/' + image,
    ));
  }

  @override
  Future<void> close() {
    basicStratgeyAlltimeStatsStreamSubscription.cancel();
    return super.close();
  }
}
