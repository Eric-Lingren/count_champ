part of 'correct_plays_cubit.dart';

class CorrectPlaysState extends Equatable {
  final bool playWasCorrect;
  final String correctPlay;
  final String hand;
  final String handType;
  final int playerTotal;
  final List handRules;

  CorrectPlaysState(
      {required this.playWasCorrect, required this.correctPlay, required this.hand, required this.handType, required this.playerTotal, required this.handRules});

  @override
  List<Object> get props => [playWasCorrect, correctPlay, hand, handType, playerTotal, handRules];
}

// class CorrectPlaysInitial extends CorrectPlaysState {}
