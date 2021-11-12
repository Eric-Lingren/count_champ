part of 'deck_cubit.dart';

class DeckState extends Equatable{
  var deckRepository;
  List remainingCards;

  DeckState({
    required this.deckRepository, 
    required this.remainingCards, 
    List? cutCards, 
    int? cutCardIndex});

  @override
  List<Object?> get props => [deckRepository, remainingCards];
}
