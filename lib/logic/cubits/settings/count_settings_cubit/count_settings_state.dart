part of 'count_settings_cubit.dart';

class CountSettingsState extends Equatable {
  double deckQuantity;
  bool showCount;
  bool speedCountEnabled;
  double cardsPerSecond;
  bool isSpeedCountRunning;
  bool hiLoEnabled;
  bool hiOpt1Enabled;
  bool hiOpt2Enabled;
  bool halvesEnabled;
  bool koEnabled;
  bool red7Enabled;
  bool zenEnabled;
  bool omega2Enabled;

  CountSettingsState({
    required this.deckQuantity,
    required this.showCount,
    required this.speedCountEnabled,
    required this.cardsPerSecond,
    required this.isSpeedCountRunning,
    required this.hiLoEnabled,
    required this.hiOpt1Enabled,
    required this.hiOpt2Enabled,
    required this.halvesEnabled,
    required this.koEnabled,
    required this.red7Enabled,
    required this.zenEnabled,
    required this.omega2Enabled,
  });

  @override
  List<Object?> get props => [
        deckQuantity,
        showCount,
        speedCountEnabled,
        cardsPerSecond,
        isSpeedCountRunning,
        hiLoEnabled,
        hiOpt1Enabled,
        hiOpt2Enabled,
        halvesEnabled,
        koEnabled,
        red7Enabled,
        zenEnabled,
        omega2Enabled,
      ];
}
