import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

// This is counter Cubit

class PlayerCubit extends Cubit<PlayerState> {
  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;
  // final DeckCubit deckCubit;
  // late StreamSubscription deckStreamSubscription;

  // PlayerCubit(this.deckCubit, deckStreamSubscription)
  PlayerCubit()
      : super(PlayerState()) {
    // monitorDeckCubit();
  }

  // StreamSubscription<DeckState> monitorDeckCubit() {
  //   return deckStreamSubscription = deckCubit.stream.listen((deckState) {
  //     print(deckState);
  //     // if (internetState is InternetConnected &&
  //     //     internetState.connectionType == ConnectionTypes.Wifi) {
  //     //   increment();
  //     // } else if (internetState is InternetConnected &&
  //     //     internetState.connectionType == ConnectionTypes.Mobile) {
  //     //   decrement();
  //     // }
  //     test();
  //   });
  // }

  // void test() {
  //   print('ran listen');
  // }
}
