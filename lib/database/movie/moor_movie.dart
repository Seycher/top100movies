
import 'package:moor_flutter/moor_flutter.dart';

class MoorMovies extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  IntColumn get year => integer()();

  TextColumn get category => text()();

  TextColumn get director => text()();

  IntColumn get duration => integer()();

  TextColumn get plot => text()();

  TextColumn get encouragement => text()();

  DateTimeColumn get watchedDate => dateTime().nullable()();

  TextColumn get posterUrl => text().withDefault(
      const Constant('https://i.ytimg.com/vi/XOcYnJGYqU8/maxresdefault.jpg'))();

  TextColumn get rewordUrl => text().withDefault(const Constant(
      'https://i.pinimg.com/236x/6a/df/47/6adf47f699905fff05f17550115bd47c--pulp-fiction-poster-pulp-fiction-illustration.jpg'))();

  BoolColumn get isScratched => boolean().withDefault(const Constant(false))();
}
