import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basic_strategy_settings_state.dart';

class BasicStrategySettingsCubit extends Cubit<BasicStrategySettingsState> {
  var bsAllHands;
  var bsHardHands;
  var bsSoftHands;
  var bsSplitHands;
  var bsIllustrious18;
  var bsfab4;
  var bsInsurance;
  BasicStrategySettingsCubit()
      : super(BasicStrategySettingsState(
          // * Initial Default Game Rules:
          canDas: false,
          canDoubleAny2: true,
          canResplitPairs: true,
          canSplitAces: true,
          canHitAfterSplittingAces: false,
          dealerStandsSoft17: true,
          canSurrender: false,
          dealerPeeks: true,
          deckQuantity: 8,
          deckPenetration: 80,
          practiceBsAllHands: true,
          practiceBsHardHands: false,
          practiceBsSoftHands: false,
          practiceBsSplitHands: false,
          practiceIllustrious18: false,
          practiceFab4: false,
          practiceInsurance: false,
        ));

  void toggleDas(value) => emit(BasicStrategySettingsState(
        canDas: value,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleCanDoubleAny2(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: value,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleCanResplitPairs(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: value,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleCanSplitAces(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: value,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleCanHitAfterSplitingAces(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: value,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleDealerStandsSoft17(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: value,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void toggleCanSurrender(value) => {
    if (!value && state.practiceFab4)
      {bsfab4 = false, bsAllHands = true}
    else{
      bsAllHands = state.practiceBsAllHands,
      bsfab4 = state.practiceFab4
    },
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: value,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: state.practiceBsHardHands,
          practiceBsSoftHands: state.practiceBsSoftHands,
          practiceBsSplitHands: state.practiceBsSplitHands,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: state.practiceInsurance,
        ))
      };
  void toggleDealerPeeks(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: value,
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void setDeckQuantity(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: value,
        deckPenetration: state.deckPenetration,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void setDeckPenetration(value) => emit(BasicStrategySettingsState(
        canDas: state.canDas,
        canResplitPairs: state.canResplitPairs,
        canDoubleAny2: state.canDoubleAny2,
        canSplitAces: state.canSplitAces,
        canHitAfterSplittingAces: state.canHitAfterSplittingAces,
        dealerStandsSoft17: state.dealerStandsSoft17,
        canSurrender: state.canSurrender,
        dealerPeeks: state.dealerPeeks,
        deckQuantity: state.deckQuantity,
        deckPenetration: value,
        practiceBsAllHands: state.practiceBsAllHands,
        practiceBsHardHands: state.practiceBsHardHands,
        practiceBsSoftHands: state.practiceBsSoftHands,
        practiceBsSplitHands: state.practiceBsSplitHands,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  void togglePracticeBsAllHands(value) => {
        if (value)
          {bsHardHands = false, bsSoftHands = false, bsSplitHands = false, bsIllustrious18 = false, bsfab4 = false, bsInsurance = false},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: value,
          practiceBsHardHands: bsHardHands,
          practiceBsSoftHands: bsSoftHands,
          practiceBsSplitHands: bsSplitHands,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        ))
      };
  void togglePracticeBsHardHands(value) => {
        if (value) {bsAllHands = false, bsIllustrious18 = false, bsfab4 = false, bsInsurance = false},
        if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: value,
          practiceBsSoftHands: false,
          practiceBsSplitHands: false,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        ))
      };
  void togglePracticeBsSoftHands(value) => {
        if (value) {bsAllHands = false, bsIllustrious18 = false, bsfab4 = false, bsInsurance = false},
        if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: false,
          practiceBsSoftHands: value,
          practiceBsSplitHands: false,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        ))
      };
  void togglePracticeBsSplitHands(value) => {
        if (value) {bsAllHands = false, bsIllustrious18 = false, bsfab4 = false, bsInsurance = false},
        if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: false,
          practiceBsSoftHands: false,
          practiceBsSplitHands: value,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        ))
      };
  void toggleIllustrious18(value) => {
    if (value)
          {bsAllHands = false, bsHardHands = false, bsSoftHands = false, bsSplitHands = false, bsfab4 = false, bsInsurance = false},
    if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: bsHardHands,
          practiceBsSoftHands: bsSoftHands,
          practiceBsSplitHands: bsSplitHands,
          practiceIllustrious18: value,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        )),
      };
  void toggleFab4(value) => {
    if (value)
          {bsAllHands = false, bsHardHands = false, bsSoftHands = false, bsSplitHands = false, bsIllustrious18 = false, bsInsurance = false},
    if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: bsHardHands,
          practiceBsSoftHands: bsSoftHands,
          practiceBsSplitHands: bsSplitHands,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: value,
          practiceInsurance: bsInsurance,
        )),
        if (value)
          {
            toggleCanSurrender(value),
          }
      };
  void toggleInsurance(value) => {
    if (value)
          {bsAllHands = false, bsHardHands = false, bsSoftHands = false, bsSplitHands = false, bsIllustrious18 = false, bsfab4 = false},
    if (!value) {bsAllHands = true},
        emit(BasicStrategySettingsState(
          canDas: state.canDas,
          canResplitPairs: state.canResplitPairs,
          canDoubleAny2: state.canDoubleAny2,
          canSplitAces: state.canSplitAces,
          canHitAfterSplittingAces: state.canHitAfterSplittingAces,
          dealerStandsSoft17: state.dealerStandsSoft17,
          canSurrender: state.canSurrender,
          dealerPeeks: state.dealerPeeks,
          deckQuantity: state.deckQuantity,
          deckPenetration: state.deckPenetration,
          practiceBsAllHands: bsAllHands,
          practiceBsHardHands: bsHardHands,
          practiceBsSoftHands: bsSoftHands,
          practiceBsSplitHands: bsSplitHands,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: value,
        )),
      };

  getRules() => state;
}
