// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorMovie extends DataClass implements Insertable<MoorMovie> {
  final int id;
  final String title;
  final String posterUrl;
  final bool isScratched;
  MoorMovie(
      {@required this.id,
      @required this.title,
      @required this.posterUrl,
      @required this.isScratched});
  factory MoorMovie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MoorMovie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      posterUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_url']),
      isScratched: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_scratched']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || posterUrl != null) {
      map['poster_url'] = Variable<String>(posterUrl);
    }
    if (!nullToAbsent || isScratched != null) {
      map['is_scratched'] = Variable<bool>(isScratched);
    }
    return map;
  }

  MoorMoviesCompanion toCompanion(bool nullToAbsent) {
    return MoorMoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      posterUrl: posterUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(posterUrl),
      isScratched: isScratched == null && nullToAbsent
          ? const Value.absent()
          : Value(isScratched),
    );
  }

  factory MoorMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorMovie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      posterUrl: serializer.fromJson<String>(json['posterUrl']),
      isScratched: serializer.fromJson<bool>(json['isScratched']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'posterUrl': serializer.toJson<String>(posterUrl),
      'isScratched': serializer.toJson<bool>(isScratched),
    };
  }

  MoorMovie copyWith(
          {int id, String title, String posterUrl, bool isScratched}) =>
      MoorMovie(
        id: id ?? this.id,
        title: title ?? this.title,
        posterUrl: posterUrl ?? this.posterUrl,
        isScratched: isScratched ?? this.isScratched,
      );
  @override
  String toString() {
    return (StringBuffer('MoorMovie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('isScratched: $isScratched')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(posterUrl.hashCode, isScratched.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoorMovie &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterUrl == this.posterUrl &&
          other.isScratched == this.isScratched);
}

class MoorMoviesCompanion extends UpdateCompanion<MoorMovie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> posterUrl;
  final Value<bool> isScratched;
  const MoorMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.isScratched = const Value.absent(),
  });
  MoorMoviesCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.posterUrl = const Value.absent(),
    this.isScratched = const Value.absent(),
  }) : title = Value(title);
  static Insertable<MoorMovie> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> posterUrl,
    Expression<bool> isScratched,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterUrl != null) 'poster_url': posterUrl,
      if (isScratched != null) 'is_scratched': isScratched,
    });
  }

  MoorMoviesCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> posterUrl,
      Value<bool> isScratched}) {
    return MoorMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      isScratched: isScratched ?? this.isScratched,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    if (isScratched.present) {
      map['is_scratched'] = Variable<bool>(isScratched.value);
    }
    return map;
  }
}

class $MoorMoviesTable extends MoorMovies
    with TableInfo<$MoorMoviesTable, MoorMovie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoorMoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterUrlMeta = const VerificationMeta('posterUrl');
  GeneratedTextColumn _posterUrl;
  @override
  GeneratedTextColumn get posterUrl => _posterUrl ??= _constructPosterUrl();
  GeneratedTextColumn _constructPosterUrl() {
    return GeneratedTextColumn('poster_url', $tableName, false,
        defaultValue: const Constant(
            'https://d.wpimg.pl/2010171932-186511389/the-room.jpg'));
  }

  final VerificationMeta _isScratchedMeta =
      const VerificationMeta('isScratched');
  GeneratedBoolColumn _isScratched;
  @override
  GeneratedBoolColumn get isScratched =>
      _isScratched ??= _constructIsScratched();
  GeneratedBoolColumn _constructIsScratched() {
    return GeneratedBoolColumn('is_scratched', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, posterUrl, isScratched];
  @override
  $MoorMoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'moor_movies';
  @override
  final String actualTableName = 'moor_movies';
  @override
  VerificationContext validateIntegrity(Insertable<MoorMovie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url'], _posterUrlMeta));
    }
    if (data.containsKey('is_scratched')) {
      context.handle(
          _isScratchedMeta,
          isScratched.isAcceptableOrUnknown(
              data['is_scratched'], _isScratchedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorMovie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MoorMovie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoorMoviesTable createAlias(String alias) {
    return $MoorMoviesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoorMoviesTable _moorMovies;
  $MoorMoviesTable get moorMovies => _moorMovies ??= $MoorMoviesTable(this);
  MovieDao _movieDao;
  MovieDao get movieDao => _movieDao ??= MovieDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorMovies];
}
