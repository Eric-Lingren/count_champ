import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:count_champ/data/repositories/deck_repisotory.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  // var deckRepository;

  // DeckRepository deckRepository;

  // ArticleBloc({@required this.repository});
  DeckCubit() : super(DeckState()) {
    // DeckCubit({required this.deckRepository}) : super(DeckState) {
    fetchCardData();
  }

  Future<List> fetchCardData() async {
    final String response =
        await rootBundle.loadString('assets/data/cards_data.json');

    // Loops over the json string to create new instaces of card data objects in a new list using the class factory
    List cards = jsonDecode(response)['cards']
        .map((data) => CardDataTemplate.fromJson(data))
        .toList();
    setCardList(cards);
    return cards;
  }

  void setCardList(cards) => emit(DeckState(deckRepository: cards));
  // CounterCubit(
  //     {required this.internetCubit, internetStreamSubscription})
  //     : super(CounterState(counterValue: 0, wasIncremented: false)) {
  //   monitorInternetCubit();
  // }

  // StreamSubscription<InternetState> monitorInternetCubit() {
  //   return internetStreamSubscription = internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionTypes.Wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionTypes.Mobile) {
  //       decrement();
  //     }
  //   });
  // }

  // @override
  // DeckState get initialState => ArticleInitialState();

  // DeckCubit() : super(DeckState(counter: 0));

  // void test() {
  //   print('test');
  // }

  // initDeckData() async {
  //   deckData = await readJson();
  // }

}


// class FetchDeckData extends DeckCubit {
//   @override
//   // TODO: implement props
//   List<Object> get props => null;
// }