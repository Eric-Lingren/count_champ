import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:count_champ/data/models/basic_strategey_charts/bs_deviations/deviation_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_deviations/insurance_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_10_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_11_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_12_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_13_14_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_15_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_16_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_17_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_18_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_7_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_8_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_hard_hands/hard_9_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_12_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_14_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_16_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_18_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_22_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_4_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_6_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_pair_hands/pair_8_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_13_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_14_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_15_16_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_17_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_18_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_19_plays.dart';
import 'package:count_champ/data/models/basic_strategey_charts/bs_soft_hands/soft_20_plays.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategey_settings_cubit/basic_strategey_settings_cubit.dart';

part 'correct_plays_state.dart';

class CorrectPlaysCubit extends Cubit<CorrectPlaysState> {
  final BasicStrategeySettingsCubit basicStrategeySettingsCubit;
  late StreamSubscription basicStrategeySettingsStreamSubscription;
  final DeckCubit deckCubit;
  late StreamSubscription deckStreamSubscription;
  late bool _canDas;
  late bool _canDoubleAny2;
  late bool _canSplitAces;
  late bool _dealerHitsSoft17;
  late bool _canSurrender;
  late bool _practiceIllustrious18;
  late bool _practiceFab4;
  late bool _practiceInsurance;
  late double _deckQuantity;
  late int _trueCount;
  int _playerTotal = 0;
  int _dealerFaceTotal = 0;
  String _handType = '';
  int count = 0;

  CorrectPlaysCubit(
      {required this.basicStrategeySettingsCubit,
      required this.deckCubit,
      deckStreamSubscription,
      basicStrategeySettingsStreamSubscription})
      : super(CorrectPlaysState(
            playWasCorrect: true, correctPlay: '', hand: '', handType: '')) {
    _manageLocalRules(basicStrategeySettingsCubit.state);
    _setHandInfo(deckCubit.state);
    _monitorBasicStrategeySettingsCubit();
    _monitorDeckCubit();
  }

  StreamSubscription<BasicStrategeySettingsState> _monitorBasicStrategeySettingsCubit() {
    return basicStrategeySettingsStreamSubscription =
        basicStrategeySettingsCubit.stream.listen((basisStrategeyGameSettingsState) {
      _manageLocalRules(basisStrategeyGameSettingsState);
    });
  }

  void _manageLocalRules(basisStrategeyGameSettingsState) {
    _canDas = basisStrategeyGameSettingsState.canDas;
    _canDoubleAny2 = basisStrategeyGameSettingsState.canDoubleAny2;
    _canSplitAces = basisStrategeyGameSettingsState.canSplitAces;
    _dealerHitsSoft17 = basisStrategeyGameSettingsState.dealerHitsSoft17;
    _canSurrender = basisStrategeyGameSettingsState.canSurrender;
    _deckQuantity = basisStrategeyGameSettingsState.deckQuantity;
    _practiceIllustrious18 = basisStrategeyGameSettingsState.practiceIllustrious18;
    _practiceFab4 = basisStrategeyGameSettingsState.practiceFab4;
    _practiceInsurance = basisStrategeyGameSettingsState.practiceInsurance;
  }

  StreamSubscription<DeckState> _monitorDeckCubit() {
    return deckStreamSubscription = deckCubit.stream.listen((deckState) {
      if (deckState.playerHand.isNotEmpty) _setHandInfo(deckState);
    });
  }

  void _setHandInfo(deckState) {
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
    _trueCount = deckState.trueCount;
  }

  void checkPlay(chosenPlay) {
    List handRules = [];
    String correctPlay = '';
    bool foundInsuranceMatch = false;
    bool foundDeviationMatch = false;

    //* Checks Insurance Gameplay Rules for the correct play
    if(_practiceInsurance){
      correctPlay = _findInsuranceBsRules();
      if (correctPlay != 'none') foundInsuranceMatch = true;
    }

    //* Checks Deviation Gameplay Rules for the corerct play
    if (!foundInsuranceMatch && (_practiceFab4 == true || _practiceIllustrious18 == true)) {
      correctPlay = _findDeviationBsRules();
      if (correctPlay != 'none') foundDeviationMatch = true;
    }
    
    //* Checks Standard Gameplay Rules for all hand options
    if(!foundInsuranceMatch && !foundDeviationMatch ) {
      if (_handType == 'hard') handRules = _findHardBsRules();
      if (_handType == 'soft') handRules = _findSoftBsRules();
      if (_handType == 'pair') {
        if (_playerTotal == 10 || _playerTotal == 20) {
          handRules = _findHardBsRules();
        } else {
          handRules = _findPairBsRules();
        }
      }
      //* Sets the correct play for comparison
      correctPlay = handRules[_dealerFaceTotal - 2];
    }

    //* Renders text outputt for CorrectPlayWidget
    String hand = 'Player: ${_playerTotal}  VS  Dealer: ${_dealerFaceTotal}';

    //* Resets a pair of 10's to a hard hand of 20 for convention in reporting
    if (_playerTotal == 20) _handType = 'hard';
    //* Set hand type for reporting
    if(_practiceIllustrious18) _handType = 'illustrious18';
    //* Set hand type for reporting
    if(_practiceFab4) _handType = 'fab4';
    //* Set hand type for reporting
    if(_practiceInsurance) _handType = 'insurance';

    //* Determines if correct play matched users play
    if (correctPlay == chosenPlay) {
      _emitCorrectPlay(correctPlay, hand, _handType);
    } else {
      _emitIncorrectPlay(correctPlay, hand, _handType);
    }
  }

  _findHardBsRules() {
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
              _canSurrender)
          .fetch();
    }
    if (_playerTotal == 16) {
      _handRules = Hard16Plays(_dealerHitsSoft17, _deckQuantity,
              _canSurrender)
          .fetch();
    }
    if (_playerTotal == 17) {
      _handRules = Hard17Plays(_dealerHitsSoft17, _deckQuantity,
              _canSurrender)
          .fetch();
    }
    if (_playerTotal >= 18) {
      _handRules = Hard18Plays().fetch();
    }
    return _handRules;
  }

  _findSoftBsRules() {
    List _handRules = [];
    if (_playerTotal == 13) {
      _handRules = Soft13Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 14) {
      _handRules =
          Soft14Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 15 || _playerTotal == 16) {
      _handRules = Soft1516Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 17) {
      _handRules = Soft17Plays(_canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 18) {
      _handRules =
          Soft18Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 19) {
      _handRules =
          Soft19Plays(_canDoubleAny2, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal >= 20) {
      _handRules = Soft20Plays().fetch();
    }
    return _handRules;
  }

  _findPairBsRules() {
    List _handRules = [];
    if (_playerTotal == 4) {
      _handRules = Pair4Plays(_canDas, _deckQuantity).fetch();
    }
    if (_playerTotal == 6) {
      _handRules = Pair6Plays(_canDas, _deckQuantity).fetch();
    }
    if (_playerTotal == 8) {
      _handRules = Pair8Plays(_canDas, _canDoubleAny2, _deckQuantity).fetch();
    }
    if (_playerTotal == 12) {
      _handRules = Pair12Plays(_canDas, _deckQuantity).fetch();
    }
    if (_playerTotal == 14) {
      _handRules = Pair14Plays(_canDas, _dealerHitsSoft17, _canSurrender, _deckQuantity)
          .fetch();
    }
    if (_playerTotal == 16) {
      _handRules = Pair16Plays(_dealerHitsSoft17, _canSurrender, _deckQuantity)
          .fetch();
    }
    if (_playerTotal == 18) {
      _handRules =
          Pair18Plays(_canDas, _dealerHitsSoft17, _deckQuantity).fetch();
    }
    if (_playerTotal == 22) {
      _handRules = Pair22Plays(_canSplitAces).fetch();
    }
    return _handRules;
  }

  _findInsuranceBsRules(){
    String _correctPlay = '';
    _correctPlay = InsurancePlays(_trueCount, _dealerFaceTotal, _deckQuantity, _practiceInsurance).fetch();
    return _correctPlay;
  }

  _findDeviationBsRules() {
    String _correctPlay = '';
    _correctPlay = DeviationPlays(
            _dealerHitsSoft17,
            _trueCount,
            _dealerFaceTotal,
            _playerTotal,
            _canSurrender,
            _canDoubleAny2,
            _deckQuantity,
            _practiceInsurance, 
            _handType)
        .fetch();
    return _correctPlay;
  }

  void _emitCorrectPlay(correctPlay, hand, _handType) => emit(CorrectPlaysState(
      playWasCorrect: true,
      correctPlay: correctPlay,
      hand: hand,
      handType: _handType));
  void _emitIncorrectPlay(correctPlay, hand, _handType) => emit(CorrectPlaysState(
      playWasCorrect: false,
      correctPlay: correctPlay,
      hand: hand,
      handType: _handType));

  @override
  Future<void> close() {
    basicStrategeySettingsStreamSubscription.cancel();
    deckStreamSubscription.cancel();
    return super.close();
  }
}
