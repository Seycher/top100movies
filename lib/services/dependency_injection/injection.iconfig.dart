// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:applaca/services/internationalization/app_localizations_delegate.dart';
import 'package:applaca/database/database.dart';
import 'package:applaca/networking/firestore_client.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<AppLocalizationsDelegate>(
      () => AppLocalizationsDelegate());
  g.registerLazySingleton<Database>(() => Database());
  g.registerLazySingleton<MovieDao>(() => MovieDao(g<Database>()));
  g.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepository(g<SharedPreferences>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<FirestoreClient>(FirestoreClient());
  g.registerSingleton<MovieRepository>(
      MovieRepository(g<MovieDao>(), g<FirestoreClient>()));
}
