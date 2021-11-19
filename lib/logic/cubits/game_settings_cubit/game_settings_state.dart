part of 'game_settings_cubit.dart';

class GameSettingsState extends Equatable {
  bool canDas;
  bool canDoubleAny2; // False = reno rules - double only on 10-11 
  bool canResplitPairs;
  bool canSplitAces;
  bool canHitAfterSplittingAces;
  bool dealerHitsSoft17;
  bool canEarlySurrender;
  bool canLateSurrender;
  bool dealerPeeks;
  double deckQuantity;
  double deckPenetration;

  GameSettingsState({
    required this.canDas,
    required this.canDoubleAny2,
    required this.canResplitPairs,
    required this.canSplitAces,
    required this.canHitAfterSplittingAces,
    required this.dealerHitsSoft17,
    required this.canEarlySurrender,
    required this.canLateSurrender,
    required this.dealerPeeks,
    required this.deckQuantity,
    required this.deckPenetration,
  });

  @override
  List<Object?> get props => [
    canDas, 
    canDoubleAny2, 
    canResplitPairs, 
    canSplitAces, 
    canHitAfterSplittingAces, 
    dealerHitsSoft17,
    canEarlySurrender,
    canLateSurrender,
    dealerPeeks,
    deckQuantity,
    deckPenetration,
  ];
}





// abstract class GameSettingsState extends Equatable {
//   // * Initial Default Game Rules:
//   final canDas = false;
//   final canDoubleAny2 = true;
//   final canResplitPairs = true;
// }

// class GameSettingsInitial extends GameSettingsState {
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }

// class dasRule extends GameSettingsState {
//   final bool canDas;
//   dasRule({required this.canDas});
//   @override
//   List<Object?> get props => [canDas];
// }

// class doubleAny2Rule extends GameSettingsState {
//   final bool canDoubleAny2;
//   doubleAny2Rule({required this.canDoubleAny2});
//   @override
//   List<Object?> get props => [canDoubleAny2];
// }

// class resplitPairsRule extends GameSettingsState {
//   final bool canResplitPairs;
//   resplitPairsRule({required this.canResplitPairs});
//   @override
//   List<Object?> get props => [canResplitPairs];
// }
