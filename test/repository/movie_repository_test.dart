import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/networking/firestore_client.dart';
import 'package:applaca/repository/model/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/moor.dart';

class MovieDaoMock extends Mock implements MovieDao {}

MovieRepository _repository;
MovieDaoMock _movieDao;
MockFirestoreInstance _firestoreMock;
FirestoreClient _firestoreClient;

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
const String rewardUrl = '';

final moorMovie = MoorMovie(
  id: id,
  title: movieTitle,
  year: year,
  category: category,
  director: director,
  duration: duration,
  plot: plot,
  encouragement: encouragement,
  isUnlocked: isUnlocked,
  posterUrl: posterUrl,
  rewordUrl: rewardUrl,
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
  rewordUrl: Value(rewardUrl),
);

main() {
  setUp(() {
    _movieDao = MovieDaoMock();
    _firestoreMock = MockFirestoreInstance();
    _firestoreClient = FirestoreClient();

    when(_movieDao.getMovieByTitle(movieTitle))
        .thenAnswer((_) => Future.value(moorMovie));

    when(_movieDao.getMovieById(id)).thenAnswer((_) => Future.value(moorMovie));

    when(_movieDao.getAllMovies())
        .thenAnswer((_) => Future.value(listOfMoorMovies));

    when(_movieDao.watchAllMovies())
        .thenAnswer((_) => Stream.fromIterable(listOfListOfMoviesToEmit));

    _repository = MovieRepository(_movieDao, _firestoreClient);
  });

  test(
      'watchAllMoviesData() emits list of MappedMovies after first listen call',
      () {
    _repository.watchAllMoviesData().listen((list) {
      expect(list, listOfMovies);
    });
  });

  test('getAllMovies() returns list of movies', () async {
    final movies = await _repository.getAllMovies();

    expect(movies, listOfMovies);
  });

  test('getAllMovies() calls getAllMovies on Dao', () async {
    await _repository.getAllMovies();

    verify(_movieDao.getAllMovies());
  });

  test('getSingleMovieByTitle() returns single movie with matching title',
      () async {
    final movie = await _repository.getSingleMovieByTitle(movieTitle);

    expect(movie.title, movieTitle);
  });

  test('getSingleMovieByTitle() calls getMovieByTitle on Dao', () async {
    await _repository.getSingleMovieByTitle(movieTitle);

    verify(_movieDao.getMovieByTitle(movieTitle));
  });

  test('getSingleMovieById() returns single movie with matching Id', () async {
    final movie = await _repository.getSingleMovieById(id);

    expect(movie.id, id);
  });

  test('getSingleMovieById() calls getMovieById on Dao', () async {
    await _repository.getSingleMovieById(id);

    verify(_movieDao.getMovieById(id));
  });

  test('unlockMovie() calls unlockMovie on Dao', () async {
    when(_movieDao.unlockMovie(movieTitle, true, DateTime(1)))
        .thenAnswer((_) => null);
    await _repository.unlockMovie(movieTitle, true, DateTime(1));

    verify(_movieDao.unlockMovie(movieTitle, true, DateTime(1)));
  });

  test('addMovie() calls insertMovie on Dao', () async {
    when(_movieDao.insertMovie(moorMovieCompanion)).thenAnswer(
      (_) => null,
    );
    await _repository.addMovie(
      movieTitle,
      year,
      category,
      director,
      duration,
      plot,
      encouragement,
      posterUrl,
      rewardUrl,
    );

    verify(_movieDao.insertMovie(moorMovieCompanion));
  });
}
