import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/repository/movie.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/movie_repository_mock.dart';
import '../../mocks/shared_preferences_repository_mock.dart';
import '../../repository/movie_repository_test.dart';

const int id = 1;
const String movieTitle = 'title';
const int year = 1;
const String category = '';
const String director = '';
const int duration = 1;
const String plot = '';
const String encouragement = '';
const bool isUnlocked = false;
const String posterUrl = '';
const String rewordUrl = '';
final movie = Movie(id, movieTitle, year, category, director, duration, plot,
    encouragement, DateTime(1), posterUrl, rewordUrl, false);
const List<Movie> emptyMovieList = [];
final movieList = [movie, movie];

MovieRepositoryMock _repository;
GlobalKey<NavigatorState> _navigator;
SharedPreferencesRepositoryMock _prefRepo;

main() {
  setUp(() {
    _repository = MovieRepositoryMock();
    _navigator = GlobalKey<NavigatorState>();
    _prefRepo = SharedPreferencesRepositoryMock();

    when(_repository.watchAllMoviesData()).thenAnswer(
      (_) => Stream.value(listOfMovies.toList()),
    );
  });

  blocTest(
    'ListOfMoviesBloc emits nothing when nothing added',
    build: () async => ListOfMoviesBloc(_repository, _navigator, _prefRepo),
    expect: [],
  );
  blocTest(
    'ListOfMoviesBloc calls watchAllMoviesData on repo when ScreenInitializedEvent is added',
    build: () async => ListOfMoviesBloc(_repository, _navigator, _prefRepo),
    act: (bloc) => bloc.add(ScreenInitializedEvent()),
    verify: (_) async => verify(_repository.watchAllMoviesData()).called(1),
  );

  blocTest(
    'ListOfMoviesBloc emits NoMoviesAvailableState when DataReceivedEvent is added with empty List',
    build: () async => ListOfMoviesBloc(_repository, _navigator, _prefRepo),
    act: (bloc) => bloc.add(DataReceivedEvent(emptyMovieList)),
    expect: [NoMoviesAvailableState()],
  );

  blocTest(
    'ListOfMoviesBloc emits MoviesAvailableState when DataReceivedEvent is added with List of Movies',
    build: () async => ListOfMoviesBloc(_repository, _navigator, _prefRepo),
    act: (bloc) => bloc.add(DataReceivedEvent(movieList)),
    expect: [MoviesAvailableState(movieList, null)],
  );
}
