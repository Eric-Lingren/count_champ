import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/achievements_cubit/bs_achievements_cubit/bs_achievements_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'achievements_state.dart';

class AchievementsCubit extends HydratedCubit<AchievementsState> {
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
    bool achievementReached = true;
    // Prevents achievement alerts if stats are reset
    if (bsAchievementsState.bsTotalPlayedAchievement < 0) {
      achievementReached = false;
    }
    emit(AchievementsState(
        achievementReached: achievementReached,
        achievementText: bsAchievementsState.bsAchievementText,
        achievementImagePath: bsAchievementsState.bsAchievementImagePath,
        bsTotalPlayedAchievement:
            bsAchievementsState.bsTotalPlayedAchievement));
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
  AchievementsState? fromJson(Map<String, dynamic> json) {
    return AchievementsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AchievementsState state) {
    return state.toMap();
  }

  @override
  Future<void> close() {
    bsAchievementsStreamSubscription.cancel();
    return super.close();
  }
}
