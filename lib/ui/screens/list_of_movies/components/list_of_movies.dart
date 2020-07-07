import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/repository/model/movie.dart';
import 'package:flutter/material.dart';

import 'movie_tile/movie_tile.dart';

Widget listOfMovies(
  final ListOfMoviesBloc listOfMoviesBloc,
  final List<Movie> listOfMovies,
) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      final movie = listOfMovies[index];
      return MovieTile(
        title: movie.title,
        year: movie.year,
        isUnlocked: movie.isUnlocked,
        duration: movie.duration,
        category: movie.category,
        posterUrl: movie.posterUrl,
        rewardUrl: movie.rewardUrl,
        time: movie.time,
        onMovieClick: () {
          listOfMoviesBloc.add(MovieClickedEvent(movie.title));
        },
      );
    },
    itemCount: listOfMovies.length,
  );
}
