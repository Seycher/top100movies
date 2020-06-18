import 'dart:async';

import 'package:applaca/repository/movie.dart';
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
    // debug
    await _debugAddValuesToDatabase();
    // debug
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

  Future _debugAddValuesToDatabase() async {
    await Future.delayed(const Duration(seconds: 3));
    final movies = await _movieRepository.getAllMovies();
    if (movies != null) {
      if (movies.length == 0) {
        await _movieRepository.addMovie(
          "Pulp Fiction",
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
          "Forrest Gump1",
          1994,
          "Dramat / Komedia",
          "Robert Zemeckis",
          142,
          "Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.",
          'Ten z mężczyzną z czekladkami na ławczesce oraz cytatem Run Forest, run!',
          "https://fwcdn.pl/fpo/09/98/998/7314731.3.jpg",
          'https://i.pinimg.com/originals/0b/a7/00/0ba70078291e93a138d5c5e722f9698c.jpg',
        );
        await _movieRepository.addMovie(
          "Forrest Gump2",
          1994,
          "Dramat / Komedia",
          "Robert Zemeckis",
          142,
          "Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.",
          'Ten z mężczyzną z czekladkami na ławczesce oraz cytatem Run Forest, run!',
          "https://fwcdn.pl/fpo/09/98/998/7314731.3.jpg",
          'https://i.pinimg.com/originals/0b/a7/00/0ba70078291e93a138d5c5e722f9698c.jpg',
        );
        await _movieRepository.addMovie(
          "Forrest Gump3",
          1994,
          "Dramat / Komedia",
          "Robert Zemeckis",
          142,
          "Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.",
          'Ten z mężczyzną z czekladkami na ławczesce oraz cytatem Run Forest, run!',
          "https://fwcdn.pl/fpo/09/98/998/7314731.3.jpg",
          'https://i.pinimg.com/originals/0b/a7/00/0ba70078291e93a138d5c5e722f9698c.jpg',
        );
        await _movieRepository.addMovie(
          "Forrest Gump4",
          1994,
          "Dramat / Komedia",
          "Robert Zemeckis",
          142,
          "Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.",
          'Ten z mężczyzną z czekladkami na ławczesce oraz cytatem Run Forest, run!',
          "https://fwcdn.pl/fpo/09/98/998/7314731.3.jpg",
          'https://i.pinimg.com/originals/0b/a7/00/0ba70078291e93a138d5c5e722f9698c.jpg',
        );
        await _movieRepository.unlockMovie(
            'FORREST GUMP1', true, DateTime.now());
      }
    }
  }
}
