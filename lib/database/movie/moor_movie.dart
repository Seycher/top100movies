import 'package:moor/moor.dart';

class MoorMovies extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get posterUrl => text().withDefault(
      const Constant('https://d.wpimg.pl/2010171932-186511389/the-room.jpg'))();

  BoolColumn get isScratched => boolean().withDefault(const Constant(false))();
}
