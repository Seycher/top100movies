import 'dart:async';
import 'dart:math';

import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/ui/screens/unlock_reward/navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'draw_movie_event.dart';
import 'draw_movie_state.dart';

class DrawMovieBloc extends Bloc<DrawMovieEvent, DrawMovieState> {
  final MovieRepository _movieRepository;
  final GlobalKey<NavigatorState> _navigator;
  final SharedPreferencesRepository _sharedPreferences;

  DrawMovieBloc(
    this._movieRepository,
    this._navigator,
    this._sharedPreferences,
  );

  @override
  DrawMovieState get initialState => InitialDrawMovieState();

  @override
  Stream<DrawMovieState> mapEventToState(
    DrawMovieEvent event,
  ) async* {
    if (event is SelectTheInitialState) {
      yield await _selectInitialState();
    } else if (event is ShuffleButtonPressedEvent) {
      yield await _drawNewMovie();
    } else if (event is ChallengeAcceptedButtonPressedEvent) {
      yield await _acceptChallenge();
    } else if (event is DrawAgainButtonPressedEvent) {
      yield await _drawNewMovie();
    } else if (event is SawItButtonPressedEvent) {
      await _unlockReward();
    } else if (event is ChallengeCompletedButtonPressedEvent) {
      await _unlockReward();
    } else if (event is ResignationButtonPressedEvent) {
      _removeMovieFromChallenge();
      yield await _drawNewMovie();
    }
  }

  Future<DrawMovieState> _selectInitialState() async {
    final movieId = _sharedPreferences.getCurrentFilmId();
    final movieData = _sharedPreferences.getCurrentFilmDateTime();

    if (movieId == null) {
      return DrawMovieHomeState();
    } else if (movieData == null) {
      return await _drawPreviousMovie(_sharedPreferences.getCurrentFilmId());
    } else {
      return await _acceptChallenge();
    }
  }

  Future<DrawMovieState> _drawNewMovie() async {
    final listOfLockedMovies = await _movieRepository.getAllMovies()
      ..where((movie) => !movie.isUnlocked);
    final randomMovieId = listOfLockedMovies
        .elementAt((Random().nextInt((listOfLockedMovies.length))))
        .id;
    final rejectedListOfMovieId =
    _sharedPreferences.getListOfRejectedMoviesId();

    if (listOfLockedMovies.length > 10) {
      if (rejectedListOfMovieId.contains(randomMovieId)) {
        return await _drawNewMovie();
      } else if (rejectedListOfMovieId.length >= 10) {
        rejectedListOfMovieId.removeAt(0);
        rejectedListOfMovieId.add(randomMovieId);
      } else {
        rejectedListOfMovieId.add(randomMovieId);
      }
    }
    _sharedPreferences.setListOfRejectedMoviesId(rejectedListOfMovieId);
    _sharedPreferences.setCurrentFilmId(randomMovieId);

    return await _drawPreviousMovie(randomMovieId);
  }

  Future<DrawMovieState> _drawPreviousMovie(final int id) async {
    final movie = await _movieRepository.getSingleMovieById(id);

    return MovieDrawnState(
      title: movie.title,
      year: movie.year,
      category: movie.category,
      director: movie.director,
      duration: movie.duration,
      plot: movie.plot,
      posterUrl: movie.posterUrl,
    );
  }

  Future<ChallengeAcceptedState> _acceptChallenge() async {
    if (_sharedPreferences.getCurrentFilmDateTime() == null) {
      _sharedPreferences.setCurrentFilmDateTime(DateTime.now());
    }

    final movieId = _sharedPreferences.getCurrentFilmId();

    final movie = await _movieRepository.getSingleMovieById(movieId);

    final timeLeft = _sharedPreferences
        .getCurrentFilmDateTime()
        .add(Duration(hours: 24))
        .difference(DateTime.now());

    return ChallengeAcceptedState(
      title: movie.title,
      year: movie.year,
      category: movie.category,
      director: movie.director,
      duration: movie.duration,
      plot: movie.plot,
      posterUrl: movie.posterUrl,
      timeLeft: timeLeft,
    );
  }

  Future<void> _unlockReward() async {
    final movieId = _sharedPreferences.getCurrentFilmId();
    final movie = await _movieRepository.getSingleMovieById(movieId);

    _movieRepository.unlockMovie(movie.title, true, DateTime.now());

    _removeMovieFromChallenge();

    _navigator.currentState.push(UnlockRewardRoute.get(movie.rewardUrl));
  }

  void _removeMovieFromChallenge() {
    _sharedPreferences.setCurrentFilmId(null);
    _sharedPreferences.setCurrentFilmDateTime(null);
  }
}
