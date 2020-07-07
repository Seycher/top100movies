import 'dart:async';

import 'package:applaca/repository/model/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/ui/screens/reward/navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'list_of_movies_event.dart';
import 'list_of_movies_state.dart';

class ListOfMoviesBloc extends Bloc<ListOfMoviesEvent, ListOfMoviesState> {
  final MovieRepository _movieRepository;
  final GlobalKey<NavigatorState> _navigator;
  final SharedPreferencesRepository _sharedPreferences;

  ListOfMoviesBloc(
    this._movieRepository,
    this._navigator,
    this._sharedPreferences,
  );

  @override
  ListOfMoviesState get initialState => InitialListOfMoviesState();

  @override
  Stream<ListOfMoviesState> mapEventToState(
    ListOfMoviesEvent event,
  ) async* {
    if (event is ScreenInitializedEvent) {
      _listenToMovieList();
    } else if (event is DataReceivedEvent) {
      yield await _onMoviesRequested(event.listOfMovies);
    } else if (event is MovieClickedEvent) {
      _onMovieClicked(event);
    }
  }

  Future<void> _listenToMovieList() async {
    _movieRepository.watchAllMoviesData().listen((listOfMovies) {
      this.add(DataReceivedEvent(listOfMovies));
    });
  }

  Future<ListOfMoviesState> _onMoviesRequested(
    final List<Movie> listOfMovies,
  ) async {
    if (listOfMovies.isEmpty) {
      return NoMoviesAvailableState();
    } else {
      final movieId = _sharedPreferences.getCurrentFilmId();

      if (movieId != null) {
        final movie = await _movieRepository.getSingleMovieById(movieId);

        return MoviesAvailableState(
          listOfMovies,
          movie.title,
        );
      } else {
        return MoviesAvailableState(listOfMovies, null);
      }
    }
  }

  void _onMovieClicked(final MovieClickedEvent event) {
    _navigator.currentState.push(RewardRoute.get(event.title));
  }
}
