import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/models/person/dealer.dart';
import 'package:count_champ/models/person/person.dart';
import 'package:count_champ/models/settings/game_settings.dart';
import 'package:get_it/get_it.dart';
import 'package:count_champ/models/trainers/correct_plays/correct_plays.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<GameSettings>(() => GameSettings());
  getIt.registerLazySingleton<Deck>(() => Deck());
  getIt.registerLazySingleton<CorrectPlays>(() => CorrectPlays());
  getIt.registerLazySingleton<Person>(() => Person());
  getIt.registerLazySingleton<Dealer>(() => Dealer());

}