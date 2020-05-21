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

  Future<void> scratchMovie(
    final String title,
    final bool isScratched,
  ) async {
    return await _dao.updateMovie(title, isScratched);
  }

  Future<void> addMovie(
    final String title,
    final String posterUrl,
  ) async {
    return await _dao.insertMovie(MoorMoviesCompanion(
      title: Value(title),
      posterUrl: Value(posterUrl),
    ));
  }
}
