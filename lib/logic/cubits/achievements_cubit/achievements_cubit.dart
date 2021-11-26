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
          bsTotalPlayedAchievement: 0,
        )) {
    _monitorBsAchievementsStreamSubscriptionCubit();
  }

  StreamSubscription<BsAchievementsState>
      _monitorBsAchievementsStreamSubscriptionCubit() {
    return bsAchievementsStreamSubscription =
        bsAchievementsCubit.stream.listen((bsAchievementsState) {
      print('achievement stream triggered from  bs achievements');
      _updateAchievementsList(bsAchievementsState);

    });
  }

  void _updateAchievementsList(bsAchievementsState) {
    print('in update achievemtns func');
    print(bsAchievementsState);
    emit(AchievementsState(
      bsTotalPlayedAchievement: bsAchievementsState.bsTotalPlayedAchievement,
    ));
    // emit(AchievementsState(
    //   reached1HandsPlayed: bsAchievementsState.reached1HandsPlayed,
    //   reached5HandsPlayed: bsAchievementsState.reached5HandsPlayed,
    // ));
  }

  @override
  Future<void> close() {
    bsAchievementsStreamSubscription.cancel();
    return super.close();
  }
}
