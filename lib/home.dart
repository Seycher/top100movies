import 'package:applaca/app.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/ui/pages/list_of_movies/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListOfMoviesBloc(
        Application.movieRepository,
        Application.navigator,
      ),
      child: ListOfMovies(),
    );
  }
}
