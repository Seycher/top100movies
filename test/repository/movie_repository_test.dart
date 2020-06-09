import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/repository/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/moor.dart';

class MovieDaoMock extends Mock implements MovieDao {}

MovieRepository _repository;
MovieDaoMock _movieDao;

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
final moorMovie = MoorMovie(
  id: id,
  title: movieTitle,
  year: year,
  category: category,
  director: director,
  duration: duration,
  plot: plot,
  encouragement: encouragement,
  isScratched: isScratched,
  posterUrl: posterUrl,
  rewordUrl: rewordUrl,
);
final listOfMoorMovies = [moorMovie, moorMovie];
final listOfMovies = listOfMoorMovies.map((e) => Movie.fromMoor(e));
final listOfListOfMoviesToEmit = [listOfMoorMovies, listOfMoorMovies];

final moorMovieCompanion = MoorMoviesCompanion(
  title: Value(movieTitle),
  year: Value(year),
  category: Value(category),
  director: Value(director),
  duration: Value(duration),
  plot: Value(plot),
  encouragement: Value(encouragement),
  posterUrl: Value(posterUrl),
  rewordUrl: Value(rewordUrl),
);

main() {
  setUp(() {
    _movieDao = MovieDaoMock();
    _repository = MovieRepository(_movieDao);
    when(_movieDao.getMovie(movieTitle))
        .thenAnswer((_) => Future.value(moorMovie));
    when(_movieDao.watchAllMovies())
        .thenAnswer((_) => Stream.fromIterable(listOfListOfMoviesToEmit));
  });
  test(
      'watchAllMoviesData() emits list of MappedMovies after first listen call',
      () {
    _repository.watchAllMoviesData().listen((list) {
      expect(list, listOfMovies);
    });
  });
  test('getSingleMovie() returns single movie with matching title', () async {
    final movie = await _repository.getSingleMovie(movieTitle);

    expect(movie.title, movieTitle);
  });
  test('getSingleMovie() calls getMovie on Dao', () async {
    await _repository.getSingleMovie(movieTitle);

    verify(_movieDao.getMovie(movieTitle));
  });
  test('unlockMovie() calls unlockMovie on Dao', () async {
    when(_movieDao.unlockMovie(movieTitle, true, DateTime(1)))
        .thenAnswer((_) => null);
    await _repository.unlockMovie(movieTitle, true, DateTime(1));

    verify(_movieDao.unlockMovie(movieTitle, true, DateTime(1)));
  });
  test('addMovie() calls insertMovie on Dao', () async {
    when(_movieDao.insertMovie(moorMovieCompanion)).thenAnswer((_) => null);
    await _repository.addMovie(
      movieTitle,
      year,
      category,
      director,
      duration,
      plot,
      encouragement,
      posterUrl,
      rewordUrl,
    );

    verify(_movieDao.insertMovie(moorMovieCompanion));
  });
}
