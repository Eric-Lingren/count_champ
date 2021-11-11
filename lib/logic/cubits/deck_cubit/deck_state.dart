part of 'deck_cubit.dart';

class DeckState {
  int counter = 0;
  var deckRepository;

  // DeckState({required this.counter});
  DeckState({this.deckRepository});
  // DeckState(deckRepository);
  // DeckState({required this.deckData});

  @override
  List<Object?> get props => [counter, deckRepository];
}

// class DeckLoadedState extends DeckState {
//   List deckData;

//   DeckLoadedState({required this.deckData});
// }
// class ArticleLoadedState extends ArticleState {

//   List<Articles> articles;

//   ArticleLoadedState({@required this.articles});