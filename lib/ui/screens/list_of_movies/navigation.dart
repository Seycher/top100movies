import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:applaca/ui/screens/list_of_movies/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMoviesRoute {
  static Route get() {
    return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider(
        create: (BuildContext context) => ListOfMoviesBloc(
          getIt<MovieRepository>(),
          getIt<GlobalKey<NavigatorState>>(),
          getIt<SharedPreferencesRepository>(),
        ),
        child: ListOfMoviesScreen(),
      ),
    );
  }
}
