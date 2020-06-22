import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_event.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_state.dart';
import 'package:applaca/repository/movie.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/movie_repository_mock.dart';
import '../../mocks/shared_preferences_repository_mock.dart';

MovieRepositoryMock _repository;
GlobalKey<NavigatorState> _navigator;
SharedPreferencesRepositoryMock _prefRepo;

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
    encouragement, null, posterUrl, rewordUrl, false);

main() {
  setUp(() {
    _repository = MovieRepositoryMock();
    _navigator = GlobalKey<NavigatorState>();
    _prefRepo = SharedPreferencesRepositoryMock();
  });
  whenMovieRepositoryReturnsMovieById() {
    when(_prefRepo.getCurrentFilmId()).thenAnswer((_) => id);
    when(_repository.getSingleMovieById(id)).thenAnswer(
      (_) => Future.value(movie),
    );
  }

  blocTest(
    'DrawMovieBloc emits nothing when nothing added',
    build: () async => DrawMovieBloc(_repository, _navigator, _prefRepo),
    expect: [],
  );
  blocTest(
    'DrawMovieBloc calls getCurrentFilmId on _prefRepo when added OnShuffleButtonClickedEvent',
    build: () async => DrawMovieBloc(_repository, _navigator, _prefRepo),
    act: (bloc) => bloc.add(ShuffleButtonPressedEvent()),
    verify: (_) async => verify(_prefRepo.getCurrentFilmId()).called(1),
  );

  blocTest(
    'DrawMovieBloc emits MovieDrawnState with movie Data when added OnShuffleButtonClickedEvent and there is saved id in sharedPreferences',
    build: () async {
      whenMovieRepositoryReturnsMovieById();
      return DrawMovieBloc(_repository, _navigator, _prefRepo);
    },
    act: (bloc) => bloc.add(ShuffleButtonPressedEvent()),
    verify: (_) async => verify(_prefRepo.getCurrentFilmId()).called(1),
    expect: [
      MovieDrawnState(
        title: movieTitle,
        year: year,
        category: category,
        director: director,
        duration: duration,
        plot: plot,
        posterUrl: posterUrl,
      )
    ],
  );

  blocTest(
    'DrawMovieBloc emits ChallengeAcceptedState when added OnChallengeAcceptedButtonClickedEvent',
    build: () async {
      whenMovieRepositoryReturnsMovieById();

      when(_prefRepo.getCurrentFilmDateTime())
          .thenAnswer((_) => DateTime.now());

      return DrawMovieBloc(_repository, _navigator, _prefRepo);
    },
    act: (bloc) => bloc.add(ChallengeAcceptedButtonPressedEvent()),
    expect: [
      ChallengeAcceptedState(
        title: movieTitle,
        year: year,
        category: category,
        director: director,
        duration: duration,
        plot: plot,
        posterUrl: posterUrl,
        timeLeft: Duration(hours: 24),
      )
    ],
  );

//some tests can not be done cos of random value inside private function
//requires new drawing algorithm

//  blocTest(
//    'DrawMovieBloc emits MovieDrawnState when added OnDrawAgainButtonClickedEvent',
//    build: () async {
//      whenMovieRepositoryReturnsMovieById();
//      return DrawMovieBloc(_repository, _navigator, _prefRepo);
//    },
//    act: (bloc) => bloc.add(OnDrawAgainButtonClickedEvent()),
//    expect: [
//      MovieDrawnState(
//        title: movieTitle,
//        year: year,
//        category: category,
//        director: director,
//        duration: duration,
//        plot: plot,
//        posterUrl: posterUrl,
//      )
//    ],
//  );
}
