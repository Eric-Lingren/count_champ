import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_settings_state.dart';

class CountSettingsCubit extends Cubit<CountSettingsState> {

  CountSettingsCubit()
      : super(CountSettingsState(
          // * Initial Default Game Rules:
          deckQuantity: 8.0,
          deckPenetration: 80.0,
          showCount: true,
          speedCountEnabled: false,
          cardsPerSecond: 1,
          isSpeedCountRunning: false,
          hiLoEnabled: true,
          hiOpt1Enabled: false,
          hiOpt2Enabled: false,
          halvesEnabled: false,
          koEnabled: false,
          red7Enabled: false,
          zenEnabled: false,
          omega2Enabled: false,
        ));

  void setDeckQuantity(value) => emit(CountSettingsState(
        deckQuantity: value,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void setDeckPenetration(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: value,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void toggleShowCount(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: value,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void toggleSpeedCount(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: value,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void setCardsPerSecond(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: value,
        isSpeedCountRunning: false,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void startingSpeedCount(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: value,
        hiLoEnabled: state.hiLoEnabled,
        hiOpt1Enabled: state.hiOpt1Enabled,
        hiOpt2Enabled: state.hiOpt2Enabled,
        halvesEnabled: state.halvesEnabled,
        koEnabled: state.koEnabled,
        red7Enabled: state.red7Enabled,
        zenEnabled: state.zenEnabled,
        omega2Enabled: state.omega2Enabled,
      ));

  void toggleHiLo(value) => 
    emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: value,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: false,
      ));

  void toggleHiOpt1(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: value,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: false,
      ));

  void toggleHiOpt2(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: value,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: false,
      ));

  void toggleHalves(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: value,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: false,
      ));

  void toggleKo(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: value,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: false,
      ));
      
  void toggleRed7(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: value,
        zenEnabled: false,
        omega2Enabled: false,
      ));
      
  void toggleZen(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: value,
        omega2Enabled: false,
      ));

  void toggleOmega2(value) => emit(CountSettingsState(
        deckQuantity: state.deckQuantity,
        deckPenetration: state.deckPenetration,
        showCount: state.showCount,
        speedCountEnabled: state.speedCountEnabled,
        cardsPerSecond: state.cardsPerSecond,
        isSpeedCountRunning: false,
        hiLoEnabled: false,
        hiOpt1Enabled: false,
        hiOpt2Enabled: false,
        halvesEnabled: false,
        koEnabled: false,
        red7Enabled: false,
        zenEnabled: false,
        omega2Enabled: value,
      ));

  getRules() => state;
}
