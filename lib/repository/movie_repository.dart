import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/networking/firestore_client.dart';
import 'package:applaca/networking/model/firestore_movie.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';

import 'model/movie.dart';

@singleton
class MovieRepository {
  final MovieDao _dao;
  final FirestoreClient _firestore;

  MovieRepository(this._dao, this._firestore) {
    updateLocalDatabase();
  }

  void updateLocalDatabase() async {
    final movieList = await getAllMovies();

    if (movieList.isEmpty) {
      final newMovieList = await _firestore.getMovieList();
      await addMoviesToDatabase(newMovieList);
    }
  }

  Stream<List<Movie>> watchAllMoviesData() {
    return _dao.watchAllMovies().map((moorMovies) {
      return moorMovies.map(Movie.fromMoor).toList();
    });
  }

  Future<List<Movie>> getAllMovies() async {
    final movies = await _dao.getAllMovies();

    return movies.map((movie) => Movie.fromMoor(movie)).toList();
  }

  Future<Movie> getSingleMovieByTitle(final String title) async {
    final moorMovie = await _dao.getMovieByTitle(title);

    return Movie.fromMoor(moorMovie);
  }

  Future<Movie> getSingleMovieById(final int id) async {
    final moorMovie = await _dao.getMovieById(id);

    return Movie.fromMoor(moorMovie);
  }

  Future<void> unlockMovie(
    final String title,
    final bool isUnlocked,
    final DateTime watchedTime,
  ) async {
    await _dao.unlockMovie(
      title,
      isUnlocked,
      watchedTime,
    );
  }

  Future<void> addMovie(
    final String title,
    final int year,
    final String category,
    final String director,
    final int duration,
    final String plot,
    final String encouragement,
    final String posterUrl,
    final String rewardUrl,
  ) async {
    await _dao.insertMovie(MoorMoviesCompanion(
      title: Value(title),
      year: Value(year),
      category: Value(category),
      director: Value(director),
      duration: Value(duration),
      plot: Value(plot),
      encouragement: Value(encouragement),
      posterUrl: Value(posterUrl),
      rewordUrl: Value(rewardUrl),
    ));
  }

  Future<void> addMoviesToDatabase(final List<FirestoreMovie> movieList) async {
    for (FirestoreMovie movie in movieList) {
      await addMovie(
        movie.title,
        movie.year,
        movie.category,
        movie.director,
        movie.duration,
        movie.plot,
        movie.encouragement,
        movie.posterUrl,
        movie.rewardUrl,
      );
    }
  }
}
