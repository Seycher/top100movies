// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<Database>(() => Database());
  g.registerLazySingleton<MovieDao>(() => MovieDao(g<Database>()));
  g.registerLazySingleton<MovieRepository>(
      () => MovieRepository(g<MovieDao>()));
  g.registerLazySingleton<ListOfMoviesBloc>(() =>
      ListOfMoviesBloc(g<MovieRepository>(), g<GlobalKey<NavigatorState>>()));
}
