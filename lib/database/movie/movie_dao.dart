import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/moor_movie.dart';
import 'package:moor/moor.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [MoorMovies])
class MovieDao extends DatabaseAccessor<Database> with _$MovieDaoMixin {
  MovieDao(Database db) : super(db);

  Stream<List<MoorMovie>> watchAllMovies() => select(moorMovies).watch();

  Future updateMovie(final Insertable<MoorMovie> movie) async {
    return await update(moorMovies).replace(movie);
  }

  Future<int> insertMovie(Insertable<MoorMovie> movie) async {
    return await into(moorMovies).insert(movie);
  }
}
