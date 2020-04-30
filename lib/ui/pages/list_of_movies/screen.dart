import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listOfMovieBloc = BlocProvider.of<ListOfMoviesBloc>(context);
    listOfMovieBloc.close(); // Sink closing delete later
    return BlocBuilder<ListOfMoviesBloc, ListOfMoviesState>(
      builder: (context, state) {
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
