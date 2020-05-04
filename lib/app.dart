import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/ui/pages/list_of_movies/screen.dart';
import 'package:applaca/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kPageListOfMoviesPage,
      routes: {
        kPageListOfMoviesPage: (context) => BlocProvider(
              create: (context) => ListOfMoviesBloc(),
              child: ListOfMovies(),
            ),
      },
    );
  }
}
