import 'dart:async';

import 'package:applaca/model/movie.dart';
import 'package:applaca/model/test_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'list_of_movies_event.dart';
import 'list_of_movies_state.dart';

class ListOfMoviesBloc extends Bloc<ListOfMoviesEvent, ListOfMoviesState> {
  final TestRepo testRepo;
  final GlobalKey<NavigatorState> _navigator;

  ListOfMoviesBloc(this.testRepo, this._navigator);

  @override
  ListOfMoviesState get initialState => InitialListOfMoviesState();

  @override
  Stream<ListOfMoviesState> mapEventToState(
    ListOfMoviesEvent event,
  ) async* {
    if (event is ListenMoviesEvent) {
      //TODO metoda "sluchania" listy z moora
      this.add(ScreenInitializedEvent(testRepo.listOfMovies));
    } else if (event is ScreenInitializedEvent) {
      yield await _onMoviesRequested(event.listOfMovies);
    } else if (event is PrizeUnlockedEvent) {
      yield await _unlockTheMovie(event);
    } else if (event is MovieClickedEvent) {
      await _onMovieClicked(event);
    } else if (event is LotteryIconClickedEvent) {
      await _onLotteryIconClicked(event);
    }
  }

  Future<ListOfMoviesState> _onMoviesRequested(
    final List<Movie> listOfMovies,
  ) async {
    if (listOfMovies.isEmpty) {
      return NoMoviesAvailableState();
    } else {
      return MoviesAvailableState(testRepo.listOfMovies);
    }
  }

  Future<ListOfMoviesState> _unlockTheMovie(
    final PrizeUnlockedEvent event,
  ) async {
    //TODO metoda na repo o update filmu
  }

  Future<void> _onMovieClicked(MovieClickedEvent event) {
    //TODO nawigacja do detali filmu
  }

  Future<void> _onLotteryIconClicked(LotteryIconClickedEvent event) {
    //TODO nawigajca do losowania filmów
  }
}
