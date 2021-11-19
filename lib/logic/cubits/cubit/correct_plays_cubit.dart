import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_10_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_11_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_12_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_13_14_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_15_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_16_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_17_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_18_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_9_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_13_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_14_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_15_16_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_17_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_18_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_19_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_20_plays.dart';

import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/game_settings_cubit/game_settings_cubit.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_7_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_8_plays.dart';
import 'package:equatable/equatable.dart';

part 'correct_plays_state.dart';

class CorrectPlaysCubit extends Cubit<CorrectPlaysState> {
  final GameSettingsCubit gameSettingsCubit;
  late StreamSubscription gameSettingsStreamSubscription;
  final DeckCubit deckCubit;
  late StreamSubscription deckStreamSubscription;
  late bool _canDas;
  late bool _canDoubleAny2;
  late bool _canResplitPairs;
  late bool _canSplitAces;
  late bool _canHitAfterSplittingAces;
  late bool _dealerHitsSoft17;
  late bool _canEarlySurrender;
  late bool _canLateSurrender;
  late bool _dealerPeeks;
  late double _deckQuantity;
  int _playerTotal = 0;
  int _dealerFaceTotal = 0;
  String _handType = '';
  int count = 0;

  CorrectPlaysCubit(
      {required this.gameSettingsCubit,
      required this.deckCubit,
      deckStreamSubscription,
      gameSettingsStreamSubscription})
      : super(CorrectPlaysState(
            playWasCorrect: true, correctPlay: '', hand: '', streak: 0)) {
    manageLocalRules(gameSettingsCubit.state);
    setHandInfo(deckCubit.state);
    monitorGameSettingsCubit();
    monitorDeckCubit();
  }

  StreamSubscription<GameSettingsState> monitorGameSettingsCubit() {
    return gameSettingsStreamSubscription =
        gameSettingsCubit.stream.listen((gameSettingsState) {
      manageLocalRules(gameSettingsState);
    });
  }

  void manageLocalRules(gameSettingsState) {
    _canDas = gameSettingsState.canDas;
    _canDoubleAny2 = gameSettingsState.canDoubleAny2;
    _canResplitPairs = gameSettingsState.canResplitPairs;
    _canSplitAces = gameSettingsState.canSplitAces;
    _canHitAfterSplittingAces = gameSettingsState.canHitAfterSplittingAces;
    _dealerHitsSoft17 = gameSettingsState.dealerHitsSoft17;
    _canEarlySurrender = gameSettingsState.canEarlySurrender;
    _canLateSurrender = gameSettingsState.canLateSurrender;
    _dealerPeeks = gameSettingsState.dealerPeeks;
    _deckQuantity = gameSettingsState.deckQuantity;
  }

  StreamSubscription<DeckState> monitorDeckCubit() {
    return deckStreamSubscription = deckCubit.stream.listen((deckState) {
      if (deckState.playerHand.isNotEmpty) setHandInfo(deckState);
    });
  }

  void setHandInfo(deckState) {
    _playerTotal =
        deckState.playerHand[0].value + deckState.playerHand[1].value;
    _dealerFaceTotal = deckState.dealerHand[1].value;

    if (deckState.playerHand[0].value == deckState.playerHand[1].value) {
      _handType = 'pair';
    } else if (deckState.playerHand[0].value == 11 ||
        deckState.playerHand[1].value == 11) {
      _handType = 'soft';
    } else {
      _handType = 'hard';
    }
  }

  void checkPlay(chosenPlay) {
    print('Player Choose : ${chosenPlay}');
    List handRules = [];

    _handType = 'soft';
    _dealerFaceTotal = 6;
    _playerTotal = 21;

    if (_handType == 'hard') {
      handRules = findHardBsRules();
    }
    if (_handType == 'soft') {
      print('chechking soft');
      handRules = findSoftBsRules();
    }
    if (_handType == 'split') {
      handRules = findSplitBsRules();
    }

    print(_dealerFaceTotal);
    print(_playerTotal);
    print(handRules);
    String correctPlay = handRules[_dealerFaceTotal - 2];
    String hand = 'Player: ${_playerTotal}  VS  Dealer: ${_dealerFaceTotal}';

    if (correctPlay == chosenPlay) {
      int streak = state.streak + 1;
      emitCorrectPlay(correctPlay, hand, streak);
    } else {
      int streak = 0;
      emitIncorrectPlay(correctPlay, hand, streak);
    }
  }

  findHardBsRules() {
    List _handRules = [];
    if (_playerTotal < 8) {
      _handRules = Hard7Plays().fetch();
    }
    if (_playerTotal == 8) {
      _handRules =
          Hard8Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 9) {
      _handRules =
          Hard9Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 10) {
      _handRules =
          Hard10Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 11) {
      _handRules =
          Hard11Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 12) {
      _handRules = Hard12Plays().fetch();
    }
    if (_playerTotal == 13 || _playerTotal == 14) {
      _handRules = Hard1314Plays().fetch();
    }
    if (_playerTotal == 15) {
      _handRules = Hard15Plays(_dealerHitsSoft17, _deckQuantity,
              _canEarlySurrender, _canLateSurrender)
          .fetch();
    }
    if (_playerTotal == 16) {
      _handRules = Hard16Plays(_dealerHitsSoft17, _deckQuantity,
              _canEarlySurrender, _canLateSurrender)
          .fetch();
    }
    if (_playerTotal == 17) {
      _handRules = Hard17Plays(_dealerHitsSoft17, _deckQuantity,
              _canEarlySurrender, _canLateSurrender)
          .fetch();
    }
    if (_playerTotal >= 18) {
      _handRules = Hard18Plays().fetch();
    }
    return _handRules;
  }

  findSoftBsRules() {
    List _handRules = [];
    if (_playerTotal == 13) {
      _handRules = Soft13Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 14) {
      _handRules = Soft14Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 15 || _playerTotal == 16) {
      _handRules = Soft1516Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 17 ) {
      _handRules = Soft17Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 18 ) {
      _handRules = Soft18Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 19 ) {
      _handRules = Soft19Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal >= 20 ) {
      _handRules = Soft20Plays().fetch();
    }
    return _handRules;
  }

  findSplitBsRules() {
    List _handRules = [];
    if (_playerTotal == 13) {
      _handRules = Hard7Plays().fetch();
    }
    return _handRules;
  }

  void emitCorrectPlay(correctPlay, hand, streak) => emit(CorrectPlaysState(
      playWasCorrect: true,
      correctPlay: correctPlay,
      hand: hand,
      streak: streak));
  void emitIncorrectPlay(correctPlay, hand, streak) => emit(CorrectPlaysState(
      playWasCorrect: false,
      correctPlay: correctPlay,
      hand: hand,
      streak: streak));

  @override
  Future<void> close() {
    gameSettingsStreamSubscription.cancel();
    deckStreamSubscription.cancel();
    return super.close();
  }
}