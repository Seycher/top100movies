import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/moor_movie.dart';
import 'package:moor/moor.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [MoorMovies], queries: {'updateMovie': ''})
class MovieDao extends DatabaseAccessor<Database> with _$MovieDaoMixin {
  MovieDao(Database db) : super(db);

  Stream<List<MoorMovie>> watchAllMovies() => select(moorMovies).watch();

  Future updateMovie(final String title, final bool isScratched) async {
    return await (update(moorMovies)..where((movie) => movie.title.like(title)))
        .write(MoorMoviesCompanion(isScratched: Value(isScratched)));
  }

  Future<int> insertMovie(Insertable<MoorMovie> movie) async =>
      await into(moorMovies).insert(movie);
}
