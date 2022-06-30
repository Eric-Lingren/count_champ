import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deviations_settings_state.dart';

class DeviationsSettingsCubit extends Cubit<DeviationsSettingsState> {
  // var deckQuantity;
  // var bsIllustrious18;
  // var bsfab4;
  // var bsInsurance;
  // var deviationFlashcards;
  var _hiLoEnabled = true;
  var _koEnabled = false;
  var _rekoEnabled = false;

  DeviationsSettingsCubit()
      : super(DeviationsSettingsState(
          deckQuantity: 8,
          hiLoEnabled: true,
          koEnabled: false,
          rekoEnabled: false,
          practiceIllustrious18: true,
          practiceFab4: false,
          practiceInsurance: false,
        ));

  void setDeckQuantity(value) => emit(DeviationsSettingsState(
        deckQuantity: value,
        hiLoEnabled: state.hiLoEnabled,
        koEnabled: state.koEnabled,
        rekoEnabled: state.rekoEnabled,
        practiceIllustrious18: state.practiceIllustrious18,
        practiceFab4: state.practiceFab4,
        practiceInsurance: state.practiceInsurance,
      ));
  
  void toggleHilo(value) => {
    if(value){
      _koEnabled = false,
      _rekoEnabled = false
    }else if(!value && !_koEnabled && !_rekoEnabled ){
      _koEnabled = true
    },
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: value,
          koEnabled: _koEnabled,
          rekoEnabled: _rekoEnabled,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleKo(value) => {
    if(value){
      _hiLoEnabled = false,
      _rekoEnabled = false
    }else if(!value && !_hiLoEnabled && !_rekoEnabled ){
      _hiLoEnabled = true
    },
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: _hiLoEnabled,
          koEnabled: value,
          rekoEnabled: _rekoEnabled,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleReko(value) => {
    if(value){
      _hiLoEnabled = false,
      _koEnabled = false,
    }else if(!value && !_hiLoEnabled && !_koEnabled ){
      _hiLoEnabled = true
    },
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: _hiLoEnabled,
          koEnabled: _koEnabled,
          rekoEnabled: value,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleIllustrious18(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: state.hiLoEnabled,
          koEnabled: state.koEnabled,
          rekoEnabled: state.rekoEnabled,
          practiceIllustrious18: value,
          practiceFab4: state.practiceFab4,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleFab4(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: state.hiLoEnabled,
          koEnabled: state.koEnabled,
          rekoEnabled: state.rekoEnabled,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: value,
          practiceInsurance: state.practiceInsurance,
        )),
      };

  void toggleInsurance(value) => {
        emit(DeviationsSettingsState(
          deckQuantity: state.deckQuantity,
          hiLoEnabled: state.hiLoEnabled,
          koEnabled: state.koEnabled,
          rekoEnabled: state.rekoEnabled,
          practiceIllustrious18: state.practiceIllustrious18,
          practiceFab4: state.practiceFab4,
          practiceInsurance: value,
        )),
      };

  getRules() => state;
}
