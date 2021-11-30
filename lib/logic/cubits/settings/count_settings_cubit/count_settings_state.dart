part of 'count_settings_cubit.dart';

class CountSettingsState extends Equatable {
  double deckQuantity;
  double deckPenetration;
  bool showCount;
  bool speedCountEnabled;
  double cardsPerSecond;
  bool isSpeedCountRunning;
  bool isDealingOneCard;
  bool isDealingTwoCards;
  bool hiLoEnabled;
  bool hiOpt1Enabled;
  bool hiOpt2Enabled;
  bool halvesEnabled;
  bool koEnabled;
  bool red7Enabled;
  bool zenEnabled;
  bool omega2Enabled;
  bool thorps10Enabled;
  bool acefiveEnabled;
  bool kiss1Enabled;
  bool kiss2Enabled;
  bool kiss3Enabled;
  bool canfieldExpertEnabled;
  bool canfieldMasterEnabled;
  bool mentorEnabled;
  bool rekoEnabled;
  bool silverFoxEnabled;
  bool ubz2Enabled;
  bool revereAdvPlusMinusEnabled;
  bool reverePointCountEnabled;
  bool revereApcEnabled;
  bool revere14Enabled;
  bool ustonAdvPlusMinusEnabled;
  bool ustonApcEnabled;
  bool ustonSsEnabled;

  CountSettingsState({
    required this.deckQuantity,
    required this.deckPenetration,
    required this.showCount,
    required this.speedCountEnabled,
    required this.cardsPerSecond,
    required this.isSpeedCountRunning,
    required this.isDealingOneCard,
    required this.isDealingTwoCards,
    required this.hiLoEnabled,
    required this.hiOpt1Enabled,
    required this.hiOpt2Enabled,
    required this.halvesEnabled,
    required this.koEnabled,
    required this.red7Enabled,
    required this.zenEnabled,
    required this.omega2Enabled,
    required this.thorps10Enabled,
    required this.acefiveEnabled,
    required this.kiss1Enabled,
    required this.kiss2Enabled,
    required this.kiss3Enabled,
    required this.canfieldExpertEnabled,
    required this.canfieldMasterEnabled,
    required this.mentorEnabled,
    required this.rekoEnabled,
    required this.silverFoxEnabled,
    required this.ubz2Enabled,
    required this.revereAdvPlusMinusEnabled,
    required this.reverePointCountEnabled,
    required this.revereApcEnabled,
    required this.revere14Enabled,
    required this.ustonAdvPlusMinusEnabled,
    required this.ustonApcEnabled,
    required this.ustonSsEnabled,
  });

  @override
  List<Object?> get props => [
        deckQuantity,
        deckPenetration,
        showCount,
        speedCountEnabled,
        cardsPerSecond,
        isSpeedCountRunning,
        isDealingOneCard,
        isDealingTwoCards,
        hiLoEnabled,
        hiOpt1Enabled,
        hiOpt2Enabled,
        halvesEnabled,
        koEnabled,
        red7Enabled,
        zenEnabled,
        omega2Enabled,
        thorps10Enabled,
        acefiveEnabled,
        kiss1Enabled,
        kiss2Enabled,
        kiss3Enabled,
        canfieldExpertEnabled,
        canfieldMasterEnabled,
        mentorEnabled,
        rekoEnabled,
        silverFoxEnabled,
        ubz2Enabled,
        revereAdvPlusMinusEnabled,
        reverePointCountEnabled,
        revereApcEnabled,
        revere14Enabled,
        ustonAdvPlusMinusEnabled,
        ustonApcEnabled,
        ustonSsEnabled,
      ];
}
