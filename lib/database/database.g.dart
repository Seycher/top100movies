// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorMovie extends DataClass implements Insertable<MoorMovie> {
  final int id;
  final String title;
  final int year;
  final String category;
  final String director;
  final int duration;
  final String plot;
  final String encouragement;
  final DateTime watchedDate;
  final String posterUrl;
  final String rewordUrl;
  final bool isUnlocked;
  MoorMovie(
      {@required this.id,
      @required this.title,
      @required this.year,
      @required this.category,
      @required this.director,
      @required this.duration,
      @required this.plot,
      @required this.encouragement,
      this.watchedDate,
      @required this.posterUrl,
      @required this.rewordUrl,
      @required this.isUnlocked});
  factory MoorMovie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MoorMovie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      year: intType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      director: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}director']),
      duration:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}duration']),
      plot: stringType.mapFromDatabaseResponse(data['${effectivePrefix}plot']),
      encouragement: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}encouragement']),
      watchedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}watched_date']),
      posterUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_url']),
      rewordUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}reword_url']),
      isUnlocked: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_unlocked']),
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
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || director != null) {
      map['director'] = Variable<String>(director);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || plot != null) {
      map['plot'] = Variable<String>(plot);
    }
    if (!nullToAbsent || encouragement != null) {
      map['encouragement'] = Variable<String>(encouragement);
    }
    if (!nullToAbsent || watchedDate != null) {
      map['watched_date'] = Variable<DateTime>(watchedDate);
    }
    if (!nullToAbsent || posterUrl != null) {
      map['poster_url'] = Variable<String>(posterUrl);
    }
    if (!nullToAbsent || rewordUrl != null) {
      map['reword_url'] = Variable<String>(rewordUrl);
    }
    if (!nullToAbsent || isUnlocked != null) {
      map['is_unlocked'] = Variable<bool>(isUnlocked);
    }
    return map;
  }

  MoorMoviesCompanion toCompanion(bool nullToAbsent) {
    return MoorMoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      director: director == null && nullToAbsent
          ? const Value.absent()
          : Value(director),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      plot: plot == null && nullToAbsent ? const Value.absent() : Value(plot),
      encouragement: encouragement == null && nullToAbsent
          ? const Value.absent()
          : Value(encouragement),
      watchedDate: watchedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(watchedDate),
      posterUrl: posterUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(posterUrl),
      rewordUrl: rewordUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(rewordUrl),
      isUnlocked: isUnlocked == null && nullToAbsent
          ? const Value.absent()
          : Value(isUnlocked),
    );
  }

  factory MoorMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorMovie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      year: serializer.fromJson<int>(json['year']),
      category: serializer.fromJson<String>(json['category']),
      director: serializer.fromJson<String>(json['director']),
      duration: serializer.fromJson<int>(json['duration']),
      plot: serializer.fromJson<String>(json['plot']),
      encouragement: serializer.fromJson<String>(json['encouragement']),
      watchedDate: serializer.fromJson<DateTime>(json['watchedDate']),
      posterUrl: serializer.fromJson<String>(json['posterUrl']),
      rewordUrl: serializer.fromJson<String>(json['rewordUrl']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'year': serializer.toJson<int>(year),
      'category': serializer.toJson<String>(category),
      'director': serializer.toJson<String>(director),
      'duration': serializer.toJson<int>(duration),
      'plot': serializer.toJson<String>(plot),
      'encouragement': serializer.toJson<String>(encouragement),
      'watchedDate': serializer.toJson<DateTime>(watchedDate),
      'posterUrl': serializer.toJson<String>(posterUrl),
      'rewordUrl': serializer.toJson<String>(rewordUrl),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
    };
  }

  MoorMovie copyWith(
          {int id,
          String title,
          int year,
          String category,
          String director,
          int duration,
          String plot,
          String encouragement,
          DateTime watchedDate,
          String posterUrl,
          String rewordUrl,
          bool isUnlocked}) =>
      MoorMovie(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year ?? this.year,
        category: category ?? this.category,
        director: director ?? this.director,
        duration: duration ?? this.duration,
        plot: plot ?? this.plot,
        encouragement: encouragement ?? this.encouragement,
        watchedDate: watchedDate ?? this.watchedDate,
        posterUrl: posterUrl ?? this.posterUrl,
        rewordUrl: rewordUrl ?? this.rewordUrl,
        isUnlocked: isUnlocked ?? this.isUnlocked,
      );
  @override
  String toString() {
    return (StringBuffer('MoorMovie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('category: $category, ')
          ..write('director: $director, ')
          ..write('duration: $duration, ')
          ..write('plot: $plot, ')
          ..write('encouragement: $encouragement, ')
          ..write('watchedDate: $watchedDate, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('rewordUrl: $rewordUrl, ')
          ..write('isUnlocked: $isUnlocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              year.hashCode,
              $mrjc(
                  category.hashCode,
                  $mrjc(
                      director.hashCode,
                      $mrjc(
                          duration.hashCode,
                          $mrjc(
                              plot.hashCode,
                              $mrjc(
                                  encouragement.hashCode,
                                  $mrjc(
                                      watchedDate.hashCode,
                                      $mrjc(
                                          posterUrl.hashCode,
                                          $mrjc(rewordUrl.hashCode,
                                              isUnlocked.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoorMovie &&
          other.id == this.id &&
          other.title == this.title &&
          other.year == this.year &&
          other.category == this.category &&
          other.director == this.director &&
          other.duration == this.duration &&
          other.plot == this.plot &&
          other.encouragement == this.encouragement &&
          other.watchedDate == this.watchedDate &&
          other.posterUrl == this.posterUrl &&
          other.rewordUrl == this.rewordUrl &&
          other.isUnlocked == this.isUnlocked);
}

class MoorMoviesCompanion extends UpdateCompanion<MoorMovie> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> year;
  final Value<String> category;
  final Value<String> director;
  final Value<int> duration;
  final Value<String> plot;
  final Value<String> encouragement;
  final Value<DateTime> watchedDate;
  final Value<String> posterUrl;
  final Value<String> rewordUrl;
  final Value<bool> isUnlocked;
  const MoorMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.year = const Value.absent(),
    this.category = const Value.absent(),
    this.director = const Value.absent(),
    this.duration = const Value.absent(),
    this.plot = const Value.absent(),
    this.encouragement = const Value.absent(),
    this.watchedDate = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.rewordUrl = const Value.absent(),
    this.isUnlocked = const Value.absent(),
  });
  MoorMoviesCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required int year,
    @required String category,
    @required String director,
    @required int duration,
    @required String plot,
    @required String encouragement,
    this.watchedDate = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.rewordUrl = const Value.absent(),
    this.isUnlocked = const Value.absent(),
  })  : title = Value(title),
        year = Value(year),
        category = Value(category),
        director = Value(director),
        duration = Value(duration),
        plot = Value(plot),
        encouragement = Value(encouragement);
  static Insertable<MoorMovie> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<int> year,
    Expression<String> category,
    Expression<String> director,
    Expression<int> duration,
    Expression<String> plot,
    Expression<String> encouragement,
    Expression<DateTime> watchedDate,
    Expression<String> posterUrl,
    Expression<String> rewordUrl,
    Expression<bool> isUnlocked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (year != null) 'year': year,
      if (category != null) 'category': category,
      if (director != null) 'director': director,
      if (duration != null) 'duration': duration,
      if (plot != null) 'plot': plot,
      if (encouragement != null) 'encouragement': encouragement,
      if (watchedDate != null) 'watched_date': watchedDate,
      if (posterUrl != null) 'poster_url': posterUrl,
      if (rewordUrl != null) 'reword_url': rewordUrl,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
    });
  }

  MoorMoviesCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<int> year,
      Value<String> category,
      Value<String> director,
      Value<int> duration,
      Value<String> plot,
      Value<String> encouragement,
      Value<DateTime> watchedDate,
      Value<String> posterUrl,
      Value<String> rewordUrl,
      Value<bool> isUnlocked}) {
    return MoorMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      category: category ?? this.category,
      director: director ?? this.director,
      duration: duration ?? this.duration,
      plot: plot ?? this.plot,
      encouragement: encouragement ?? this.encouragement,
      watchedDate: watchedDate ?? this.watchedDate,
      posterUrl: posterUrl ?? this.posterUrl,
      rewordUrl: rewordUrl ?? this.rewordUrl,
      isUnlocked: isUnlocked ?? this.isUnlocked,
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
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (director.present) {
      map['director'] = Variable<String>(director.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (plot.present) {
      map['plot'] = Variable<String>(plot.value);
    }
    if (encouragement.present) {
      map['encouragement'] = Variable<String>(encouragement.value);
    }
    if (watchedDate.present) {
      map['watched_date'] = Variable<DateTime>(watchedDate.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    if (rewordUrl.present) {
      map['reword_url'] = Variable<String>(rewordUrl.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
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

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedIntColumn _year;
  @override
  GeneratedIntColumn get year => _year ??= _constructYear();
  GeneratedIntColumn _constructYear() {
    return GeneratedIntColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _directorMeta = const VerificationMeta('director');
  GeneratedTextColumn _director;
  @override
  GeneratedTextColumn get director => _director ??= _constructDirector();
  GeneratedTextColumn _constructDirector() {
    return GeneratedTextColumn(
      'director',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  GeneratedIntColumn _duration;
  @override
  GeneratedIntColumn get duration => _duration ??= _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _plotMeta = const VerificationMeta('plot');
  GeneratedTextColumn _plot;
  @override
  GeneratedTextColumn get plot => _plot ??= _constructPlot();
  GeneratedTextColumn _constructPlot() {
    return GeneratedTextColumn(
      'plot',
      $tableName,
      false,
    );
  }

  final VerificationMeta _encouragementMeta =
      const VerificationMeta('encouragement');
  GeneratedTextColumn _encouragement;
  @override
  GeneratedTextColumn get encouragement =>
      _encouragement ??= _constructEncouragement();
  GeneratedTextColumn _constructEncouragement() {
    return GeneratedTextColumn(
      'encouragement',
      $tableName,
      false,
    );
  }

  final VerificationMeta _watchedDateMeta =
      const VerificationMeta('watchedDate');
  GeneratedDateTimeColumn _watchedDate;
  @override
  GeneratedDateTimeColumn get watchedDate =>
      _watchedDate ??= _constructWatchedDate();
  GeneratedDateTimeColumn _constructWatchedDate() {
    return GeneratedDateTimeColumn(
      'watched_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _posterUrlMeta = const VerificationMeta('posterUrl');
  GeneratedTextColumn _posterUrl;
  @override
  GeneratedTextColumn get posterUrl => _posterUrl ??= _constructPosterUrl();
  GeneratedTextColumn _constructPosterUrl() {
    return GeneratedTextColumn('poster_url', $tableName, false,
        defaultValue: const Constant(
            'https://i.ytimg.com/vi/XOcYnJGYqU8/maxresdefault.jpg'));
  }

  final VerificationMeta _rewordUrlMeta = const VerificationMeta('rewordUrl');
  GeneratedTextColumn _rewordUrl;
  @override
  GeneratedTextColumn get rewordUrl => _rewordUrl ??= _constructRewordUrl();
  GeneratedTextColumn _constructRewordUrl() {
    return GeneratedTextColumn('reword_url', $tableName, false,
        defaultValue: const Constant(
            'https://i.pinimg.com/236x/6a/df/47/6adf47f699905fff05f17550115bd47c--pulp-fiction-poster-pulp-fiction-illustration.jpg'));
  }

  final VerificationMeta _isUnlockedMeta = const VerificationMeta('isUnlocked');
  GeneratedBoolColumn _isUnlocked;
  @override
  GeneratedBoolColumn get isUnlocked => _isUnlocked ??= _constructIsUnlocked();
  GeneratedBoolColumn _constructIsUnlocked() {
    return GeneratedBoolColumn('is_unlocked', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        year,
        category,
        director,
        duration,
        plot,
        encouragement,
        watchedDate,
        posterUrl,
        rewordUrl,
        isUnlocked
      ];
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
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year'], _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('director')) {
      context.handle(_directorMeta,
          director.isAcceptableOrUnknown(data['director'], _directorMeta));
    } else if (isInserting) {
      context.missing(_directorMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration'], _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('plot')) {
      context.handle(
          _plotMeta, plot.isAcceptableOrUnknown(data['plot'], _plotMeta));
    } else if (isInserting) {
      context.missing(_plotMeta);
    }
    if (data.containsKey('encouragement')) {
      context.handle(
          _encouragementMeta,
          encouragement.isAcceptableOrUnknown(
              data['encouragement'], _encouragementMeta));
    } else if (isInserting) {
      context.missing(_encouragementMeta);
    }
    if (data.containsKey('watched_date')) {
      context.handle(
          _watchedDateMeta,
          watchedDate.isAcceptableOrUnknown(
              data['watched_date'], _watchedDateMeta));
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url'], _posterUrlMeta));
    }
    if (data.containsKey('reword_url')) {
      context.handle(_rewordUrlMeta,
          rewordUrl.isAcceptableOrUnknown(data['reword_url'], _rewordUrlMeta));
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
          _isUnlockedMeta,
          isUnlocked.isAcceptableOrUnknown(
              data['is_unlocked'], _isUnlockedMeta));
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
