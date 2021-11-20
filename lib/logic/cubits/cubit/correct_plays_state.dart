part of 'correct_plays_cubit.dart';

class CorrectPlaysState extends Equatable {
  final bool playWasCorrect;
  final String correctPlay;
  final String hand;
  int streak;

  CorrectPlaysState(
      {required this.playWasCorrect, required this.correctPlay, required this.hand, required this.streak});

  @override
  List<Object> get props => [playWasCorrect, correctPlay, hand, streak, ];
}

// class CorrectPlaysInitial extends CorrectPlaysState {}
