import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/repository/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

const int id = 1;
const String movieTitle = 'title';
const int year = 1;
const String category = '';
const String director = '';
const int duration = 1;
const String plot = '';
const String encouragement = '';
const bool isScratched = false;
const String posterUrl = '';
const String rewordUrl = '';
final movie = Movie(id, movieTitle, year, category, director, duration, plot,
    encouragement, DateTime(1), posterUrl, rewordUrl, false);
const List<Movie> emptyMovieList = [];
final movieList = [movie, movie];

MovieRepositoryMock _repository;
GlobalKey<NavigatorState> _navigator;

main() {
  setUp(() {
    _repository = MovieRepositoryMock();
    _navigator = GlobalKey<NavigatorState>();
  });

  blocTest(
    'ListOfMoviesBloc emits nothing when nothing added',
    build: () async => ListOfMoviesBloc(_repository, _navigator),
    expect: [],
  );
  blocTest(
    'ListOfMoviesBloc calls watchAllMoviesData on repo when ListenMoviesEvent is added',
    build: () async => ListOfMoviesBloc(_repository, _navigator),
    act: (bloc) => bloc.add(ListenMoviesEvent()),
    verify: (_) async => verify(_repository.watchAllMoviesData()).called(1),
  );
  blocTest(
    'ListOfMoviesBloc emits NoMoviesAvailableState when ScreenInitializedEvent is added with empty List',
    build: () async => ListOfMoviesBloc(_repository, _navigator),
    act: (bloc) => bloc.add(ScreenInitializedEvent(emptyMovieList)),
    expect: [NoMoviesAvailableState()],
  );
  blocTest(
    'ListOfMoviesBloc emits MoviesAvailableState when ScreenInitializedEvent is added with List of Movies',
    build: () async => ListOfMoviesBloc(_repository, _navigator),
    act: (bloc) => bloc.add(ScreenInitializedEvent(movieList)),
    expect: [MoviesAvailableState(movieList)],
  );
}
