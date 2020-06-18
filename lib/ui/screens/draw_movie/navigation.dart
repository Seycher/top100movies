import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:applaca/ui/screens/draw_movie/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawMovieRoute {
  static Route get() {
    return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider(
        create: (BuildContext context) => DrawMovieBloc(
          getIt<MovieRepository>(),
          getIt<GlobalKey<NavigatorState>>(),
          getIt<SharedPreferencesRepository>(),
        ),
        child: DrawMovieScreen(),
      ),
    );
  }
}
