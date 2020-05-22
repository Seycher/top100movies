import 'dart:async';

import 'package:applaca/repository/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'list_of_movies_event.dart';
import 'list_of_movies_state.dart';

class ListOfMoviesBloc extends Bloc<ListOfMoviesEvent, ListOfMoviesState> {
  final MovieRepository _movieRepository;
  final GlobalKey<NavigatorState> _navigator;

  ListOfMoviesBloc(this._movieRepository, this._navigator);

  @override
  ListOfMoviesState get initialState => InitialListOfMoviesState();

  @override
  Stream<ListOfMoviesState> mapEventToState(
    ListOfMoviesEvent event,
  ) async* {
    if (event is ListenMoviesEvent) {
      // debug
      _debugAddValuesToDatabase();
      _debugAddValuesToDatabase();
      _debugAddValuesToDatabase();
      _debugAddValuesToDatabase();
      _debugAddValuesToDatabase();
      _debugAddValuesToDatabase();
      // debug
      _movieRepository.watchAllMoviesData().listen((listOfMovies) {
        this.add(ScreenInitializedEvent(listOfMovies));
      });
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
      return MoviesAvailableState(listOfMovies);
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

  Future<void> _debugAddValuesToDatabase() async {
    await _movieRepository.addMovie(
      "PULP FICTION",
      1994,
      "Gangsterski",
      "Quentin Tarantino",
      154,
      "Przemoc i odkupienie w opowieści o dwóch płatnych mordercach pracujących na zlecenie mafii, żonie gangstera, bokserze i parze okradającej ludzi w restauracji.",
      'Ponieważ musisz go obejrzeć i już!',
      "https://i.ytimg.com/vi/XOcYnJGYqU8/maxresdefault.jpg",
      'https://i.pinimg.com/236x/6a/df/47/6adf47f699905fff05f17550115bd47c--pulp-fiction-poster-pulp-fiction-illustration.jpg',
    );
    await _movieRepository.addMovie(
      "FORREST GUMP",
      1994,
      "Dramat / Komedia",
      "Robert Zemeckis",
      142,
      "Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.",
      'Ten z mężczyzną z czekladkami na ławczesce oraz cytatem Run Forest, run!',
      "https://fwcdn.pl/fpo/09/98/998/7314731.3.jpg",
      'https://i.pinimg.com/originals/0b/a7/00/0ba70078291e93a138d5c5e722f9698c.jpg',
    );
  }
}
