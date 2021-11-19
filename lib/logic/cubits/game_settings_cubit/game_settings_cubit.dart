import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_settings_state.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  var alternateSurrenderValue;
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
            deckPenetration: 80));

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
      ));
  void toggleCanEarlySurrender(value) => {
    if(value && state.canLateSurrender){
      alternateSurrenderValue = false
    } else{
      alternateSurrenderValue = state.canLateSurrender
    },
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
        ))
      };
  void toggleCanLateSurrender(value) => {
    if(value && state.canEarlySurrender){
      alternateSurrenderValue = false
    } else{
      alternateSurrenderValue = state.canEarlySurrender
    },
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
      ));

  getRules() => state;
}
