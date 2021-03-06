import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_of_movies/screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListOfMoviesBloc(
        getIt<MovieRepository>(),
        getIt<GlobalKey<NavigatorState>>(),
        getIt<SharedPreferencesRepository>(),
      ),
      child: ListOfMoviesScreen(),
    );
  }
}
