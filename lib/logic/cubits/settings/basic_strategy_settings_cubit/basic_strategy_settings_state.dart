part of 'basic_strategy_settings_cubit.dart';

class BasicStrategySettingsState extends Equatable {
  bool canDas;
  bool canDoubleAny2; // False = reno rules - double only on 10-11 
  bool canResplitPairs;
  bool canSplitAces;
  bool canHitAfterSplittingAces;
  bool dealerHitsSoft17;
  bool canSurrender;
  bool dealerPeeks;
  double deckQuantity;
  double deckPenetration;
  bool practiceBsAllHands;
  bool practiceBsHardHands;
  bool practiceBsSoftHands;
  bool practiceBsSplitHands;
  bool practiceIllustrious18;
  bool practiceFab4;
  bool practiceInsurance;

  BasicStrategySettingsState({
    required this.canDas,
    required this.canDoubleAny2,
    required this.canResplitPairs,
    required this.canSplitAces,
    required this.canHitAfterSplittingAces,
    required this.dealerHitsSoft17,
    required this.canSurrender,
    required this.dealerPeeks,
    required this.deckQuantity,
    required this.deckPenetration,
    required this.practiceBsAllHands,
    required this.practiceBsHardHands,
    required this.practiceBsSoftHands,
    required this.practiceBsSplitHands,
    required this.practiceIllustrious18,
    required this.practiceFab4,
    required this.practiceInsurance,
  });

  @override
  List<Object?> get props => [
    canDas, 
    canDoubleAny2, 
    canResplitPairs, 
    canSplitAces, 
    canHitAfterSplittingAces, 
    dealerHitsSoft17,
    canSurrender,
    dealerPeeks,
    deckQuantity,
    deckPenetration,
    practiceBsAllHands,
    practiceBsHardHands,
    practiceBsSoftHands,
    practiceBsSplitHands,
    practiceIllustrious18,
    practiceFab4,
    practiceInsurance,
  ];
}