part of 'running_count_achievements_cubit.dart';

class RunningCountAchievementsState extends Equatable {
  bool didDeal;
  bool didCheckResult;

  
RunningCountAchievementsState({this.didDeal = false, required this.didCheckResult,});

  @override
  List<Object> get props => [didDeal, didCheckResult,];
}
