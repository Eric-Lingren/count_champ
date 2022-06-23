import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deviations_settings_state.dart';

class DeviationsSettingsCubit extends Cubit<DeviationsSettingsState> {
  var deckQuantity;
  var bsIllustrious18;
  var bsfab4;
  var bsInsurance;

  DeviationsSettingsCubit()
      : super(DeviationsSettingsState(
          // * Initial Default Game Rules:
          deckQuantity: 8,
          practiceIllustrious18: false,
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
        print('toggle Illustrious 18'),
        print(value),
        if (value) {bsfab4 = false, bsInsurance = false},
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: value,
          practiceFab4: bsfab4,
          practiceInsurance: bsInsurance,
        )),
      };

  void toggleFab4(value) => {
        print('toggle Fab 4'),
        print(value),
        if (value) {bsIllustrious18 = false, bsInsurance = false},
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: value,
          practiceInsurance: bsInsurance,
        )),
      };

  void toggleInsurance(value) => {
        print('toggle Insurance'),
        print(value),
        if (value) {bsIllustrious18 = false, bsfab4 = false},
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          practiceIllustrious18: bsIllustrious18,
          practiceFab4: bsfab4,
          practiceInsurance: value,
        )),
      };

  getRules() => state;
}
