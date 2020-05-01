import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOfMoviesBloc, ListOfMoviesState>(
      builder: (context, state) {
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
