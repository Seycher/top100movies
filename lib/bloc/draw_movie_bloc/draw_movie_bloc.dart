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
    if (event is ShuffleButtonPressedEvent) {
      yield await _checkIfMovieIsDrawnAndGetMovie();
    } else if (event is ChallengeAcceptedButtonPressedEvent) {
      yield await _acceptChallenge(event);
    } else if (event is DrawAgainButtonPressedEvent) {
      yield await _getRandomMovie();
    } else if (event is SawItButtonPressedEvent) {
      await _unlockReward();
    } else if (event is ChallengeCompletedButtonPressedEvent) {
      await _unlockReward();
    } else if (event is ResignationButtonPressedEvent) {
      _removeMovieFromChallenge();
      yield await _getRandomMovie();
    }
  }

  Future<DrawMovieState> _checkIfMovieIsDrawnAndGetMovie() async {
    final movieId = _sharedPreferences.getCurrentFilmId();

    if (movieId == null) {
      return await _getRandomMovie();
    } else {
      return await _drawMovie(movieId);
    }
  }

  Future<DrawMovieState> _getRandomMovie() async {
    //TODO write a drawing algorithm

    final id = Random().nextInt(4) + 1;

    _sharedPreferences.setCurrentFilmId(id);

    return await _drawMovie(id);
  }

  Future<DrawMovieState> _drawMovie(final int id) async {
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

  Future<ChallengeAcceptedState> _acceptChallenge(
    final ChallengeAcceptedButtonPressedEvent event,
  ) async {
    _sharedPreferences.setCurrentFilmDateTime(DateTime.now());

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
    _sharedPreferences.setCurrentFilmDateTime(DateTime(1));
  }
}
