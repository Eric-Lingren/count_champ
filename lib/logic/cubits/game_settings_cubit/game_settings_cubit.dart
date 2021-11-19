import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_settings_state.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  var alternateSurrenderValue;
  var bsAllHands;
  var bsHardHands;
  var bsSoftHands;
  var bsSplitHands;
  GameSettingsCubit()
      : super(GameSettingsState(
          // * Initial Default Game Rules:
          canDas: false,
          canDoubleAny2: true,
          canResplitPairs: true,
          canSplitAces: true,
          canHitAfterSplittingAces: false,
          dealerHitsSoft17: true,
          canEarlySurrender: false,
          canLateSurrender: false,
          dealerPeeks: true,
          deckQuantity: 8,
          deckPenetration: 80,
          practiceBsAllHands: true,
          practiceBsHardHands: false,
          practiceBsSoftHands: false,
          practiceBsSplitHands: false,
          practiceIllustrious18: false,
          practiceFab4: false,
        ));

  void toggleDas(value) => emit(GameSettingsState(
        canDas: value,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleCanDoubleAny2(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: value,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleCanResplitPairs(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: value,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleCanSplitAces(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: value,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleCanHitAfterSplitingAces(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: value,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleDealerHitsSoft17(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: value,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void toggleCanEarlySurrender(value) => {
        if (value && state.canLateSurrender)
          {alternateSurrenderValue = false}
        else
          {alternateSurrenderValue = state.canLateSurrender},
        emit(GameSettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerHitsSoft17: state.dealerHitsSoft17,
          canEarlySurrender: value,
          canLateSurrender: alternateSurrenderValue,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: state.practiceBsAllHands,
          practiceBsHardHands: state.practiceBsHardHands,
          practiceBsSoftHands: state.practiceBsSoftHands,
          practiceBsSplitHands: state.practiceBsSplitHands,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
        ))
      };
  void toggleCanLateSurrender(value) => {
        if (value && state.canEarlySurrender)
          {alternateSurrenderValue = false}
        else
          {alternateSurrenderValue = state.canEarlySurrender},
        emit(GameSettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerHitsSoft17: state.dealerHitsSoft17,
          canEarlySurrender: alternateSurrenderValue,
          canLateSurrender: value,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: state.practiceBsAllHands,
          practiceBsHardHands: state.practiceBsHardHands,
          practiceBsSoftHands: state.practiceBsSoftHands,
          practiceBsSplitHands: state.practiceBsSplitHands,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
        ))
      };
  void toggleDealerPeeks(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: value,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void setDeckQuantity(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: value,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void setDeckPenetration(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: value,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ));
  void togglePracticeBsAllHands(value) => {
    if (value) {
      bsHardHands = false,
      bsSoftHands = false,
      bsSplitHands = false
    },
    emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: value,
        practiceBsHardHands: bsHardHands,
        practiceBsSoftHands: bsSoftHands,
        practiceBsSplitHands: bsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ))
  };
  void togglePracticeBsHardHands(value) => {
    if (value) {
      bsAllHands = false,
      bsSoftHands = state.practiceBsSoftHands,
      bsSplitHands = state.practiceBsSplitHands
    },
    emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: bsAllHands,
        practiceBsHardHands: value,
        practiceBsSoftHands: bsSoftHands,
        practiceBsSplitHands: bsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ))
  };
  void togglePracticeBsSoftHands(value) => {
    if (value) {
      bsAllHands = false,
      bsHardHands = state.practiceBsHardHands,
      bsSplitHands = state.practiceBsSplitHands
    },
    emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: bsAllHands,
        practiceBsHardHands: bsHardHands,
        practiceBsSoftHands: value,
        practiceBsSplitHands: bsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ))
  };
  void togglePracticeBsSplitHands(value) => {
    if (value) {
      bsAllHands = false,
      bsHardHands = state.practiceBsHardHands,
      bsSoftHands = state.practiceBsSoftHands
    },
    emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: bsAllHands,
        practiceBsHardHands: bsHardHands,
        practiceBsSoftHands: bsSoftHands,
        practiceBsSplitHands: value,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
      ))
  };
  void toggleIllustrious18(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: value,
        practiceFab4: state.practiceFab4,
      ));
  void toggleFab4(value) => emit(GameSettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerHitsSoft17: state.dealerHitsSoft17,
        canEarlySurrender: state.canEarlySurrender,
        canLateSurrender: state.canLateSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: value,
      ));

  getRules() => state;
}
