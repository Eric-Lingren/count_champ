import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deviations_settings_state.dart';

class DeviationsSettingsCubit extends Cubit<DeviationsSettingsState> {
  // var deckQuantity;
  // var bsIllustrious18;
  // var bsfab4;
  // var bsInsurance;
  // var deviationFlashcards;

  DeviationsSettingsCubit()
      : super(DeviationsSettingsState(
          deckQuantity: 8,
          practiceIllustrious18: true,
          practiceFab4: false,
          practiceInsurance: false,
        ));

  void setDeckQuantity(value) => emit(DeviationsSettingsState(
        deckQuantity: value,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));

  void toggleIllustrious18(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: value,
          practiceFab4: state.practiceFab4,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleFab4(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: value,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleInsurance(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
          practiceInsurance: value,
        )),
      };

  getRules() => state;
}
