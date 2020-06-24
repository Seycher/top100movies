// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:applaca/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/internationalization/app_localizations_delegate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<AppLocalizationsDelegate>(
      () => AppLocalizationsDelegate());
  g.registerLazySingleton<Database>(() => Database());
  g.registerLazySingleton<MovieDao>(() => MovieDao(g<Database>()));
  g.registerLazySingleton<MovieRepository>(
      () => MovieRepository(g<MovieDao>()));
  g.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepository(g<SharedPreferences>()));
  g.registerFactory<UnlockRewardBloc>(() => UnlockRewardBloc(
      g<GlobalKey<NavigatorState>>(), g<String>(instanceName: 'rewardURL')));
  g.registerFactory<BottomNavigationBloc>(
      () => BottomNavigationBloc(g<GlobalKey<NavigatorState>>()));
}
