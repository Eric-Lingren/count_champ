part of 'correct_plays_cubit.dart';

class CorrectPlaysState extends Equatable {
  final bool playWasCorrect;
  final String correctPlay;
  final String hand;
  final String handType;

  CorrectPlaysState(
      {required this.playWasCorrect, required this.correctPlay, required this.hand, required this.handType});

  @override
  List<Object> get props => [playWasCorrect, correctPlay, hand, handType, ];
}

// class CorrectPlaysInitial extends CorrectPlaysState {}
