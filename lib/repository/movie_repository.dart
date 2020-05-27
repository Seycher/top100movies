import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:moor/moor.dart';

import 'movie.dart';

class MovieRepository {
  final MovieDao _dao;

  const MovieRepository(this._dao);

  Stream<List<Movie>> watchAllMoviesData() {
    return _dao.watchAllMovies().map((moorMovies) {
      return moorMovies.map(Movie.fromMoor).toList();
    });
  }

  Future<void> unlockMovie(
    final String title,
    final bool isScratched,
    final DateTime watchedTime,
  ) async {
    return await _dao.unlockMovie(
      title,
      isScratched,
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
    final String rewordUrl,
  ) async {
    return await _dao.insertMovie(MoorMoviesCompanion(
      title: Value(title),
      year: Value(year),
      category: Value(category),
      director: Value(director),
      duration: Value(duration),
      plot: Value(plot),
      encouragement: Value(encouragement),
      posterUrl: Value(posterUrl),
      rewordUrl: Value(rewordUrl),
    ));
  }
}
