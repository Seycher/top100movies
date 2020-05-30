import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/moor_movie.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';

part 'movie_dao.g.dart';

@lazySingleton
@UseDao(tables: [MoorMovies])
class MovieDao extends DatabaseAccessor<Database> with _$MovieDaoMixin {
  MovieDao(Database db) : super(db);

  Stream<List<MoorMovie>> watchAllMovies() => select(moorMovies).watch();

  Future<MoorMovie> getMovie(final String title) async {
    return await (select(moorMovies)
          ..where((movie) => movie.title.equals(title)))
        .getSingle();
  }

  Future unlockMovie(
    final String title,
    final bool isScratched,
    final DateTime watchedTime,
  ) async {
    return await (update(moorMovies)..where((movie) => movie.title.like(title)))
        .write(MoorMoviesCompanion(
      isScratched: Value(isScratched),
      watchedDate: Value(watchedTime),
    ));
  }

  Future updateMovie(final Insertable<MoorMovie> movie) async {
    return await update(moorMovies).replace(movie);
  }

  Future<int> insertMovie(Insertable<MoorMovie> movie) async {
    return await into(moorMovies).insert(movie);
  }
}
