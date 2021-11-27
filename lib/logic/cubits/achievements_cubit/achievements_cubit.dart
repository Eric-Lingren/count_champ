import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/achievements_cubit/bs_achievements_cubit/bs_achievements_cubit.dart';
import 'package:equatable/equatable.dart';

part 'achievements_state.dart';

class AchievementsCubit extends Cubit<AchievementsState> {
  final BsAchievementsCubit bsAchievementsCubit;
  late StreamSubscription bsAchievementsStreamSubscription;

  AchievementsCubit({
    required this.bsAchievementsCubit,
    bsAchievementsStreamSubscription,
  }) : super(AchievementsState(
          achievementReached: false,
          achievementText: '',
          achievementImagePath: '',
          bsTotalPlayedAchievement: 0,
        )) {
    _monitorBsAchievementsStreamSubscriptionCubit();
  }

  StreamSubscription<BsAchievementsState>
      _monitorBsAchievementsStreamSubscriptionCubit() {
    return bsAchievementsStreamSubscription =
        bsAchievementsCubit.stream.listen((bsAchievementsState) {
      _updateAchievementsList(bsAchievementsState);
    });
  }

  void _updateAchievementsList(bsAchievementsState) {
    emit(AchievementsState(
      achievementReached: true,
      achievementText: bsAchievementsState.bsAchievementText,
      achievementImagePath: bsAchievementsState.bsAchievementImagePath,
      bsTotalPlayedAchievement: bsAchievementsState.bsTotalPlayedAchievement,
    ));
  }

  clearAchievementReached() {
    emit(AchievementsState(
      achievementReached: false,
      achievementText: '',
      achievementImagePath: '',
      bsTotalPlayedAchievement: state.bsTotalPlayedAchievement,
    ));
  }

  @override
  Future<void> close() {
    bsAchievementsStreamSubscription.cancel();
    return super.close();
  }
}
