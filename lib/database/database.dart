import 'package:applaca/database/movie/moor_movie.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';


@lazySingleton
@UseMoor(tables: [MoorMovies], daos: [MovieDao])
class Database extends _$Database {
  Database()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
              path: ('db.sqlite'), logStatements: true),
        );

  @override
  int get schemaVersion => 1;
}
