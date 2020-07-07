const String idColumnName = 'id';
const String titleColumnName = 'title';
const String yearColumnName = 'year';
const String categoryColumnName = 'category';
const String directorColumnName = 'director';
const String durationColumnName = 'duration';
const String plotColumnName = 'plot';
const String encouragementColumnName = 'encouragement';
const String posterUrlColumnName = 'posterUrl';
const String rewardUrlColumnName = 'rewardUrl';

class FirestoreMovie {
  final int id;
  final String title;
  final int year;
  final String category;
  final String director;
  final int duration;
  final String plot;
  final String encouragement;
  final String posterUrl;
  final String rewardUrl;

  //TODO if you make any changes with values remember about generating new toString, and equals

  FirestoreMovie({
    this.id,
    this.title,
    this.year,
    this.category,
    this.director,
    this.duration,
    this.plot,
    this.encouragement,
    this.posterUrl,
    this.rewardUrl,
  });

  static FirestoreMovie fromMap(final Map<String, dynamic> map) {
    return FirestoreMovie(
      id: map[idColumnName],
      title: map[titleColumnName],
      year: map[yearColumnName],
      category: map[categoryColumnName],
      director: map[directorColumnName],
      duration: map[durationColumnName],
      plot: map[plotColumnName],
      encouragement: map[encouragementColumnName],
      posterUrl: map[posterUrlColumnName],
      rewardUrl: map[rewardUrlColumnName],
    );
  }

  @override
  String toString() {
    return 'FirestoreMovie{id: $id, title: $title, year: $year, category: $category, director: $director, duration: $duration, plot: $plot, encouragement: $encouragement, posterUrl: $posterUrl, rewardUrl: $rewardUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirestoreMovie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          year == other.year &&
          category == other.category &&
          director == other.director &&
          duration == other.duration &&
          plot == other.plot &&
          encouragement == other.encouragement &&
          posterUrl == other.posterUrl &&
          rewardUrl == other.rewardUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      year.hashCode ^
      category.hashCode ^
      director.hashCode ^
      duration.hashCode ^
      plot.hashCode ^
      encouragement.hashCode ^
      posterUrl.hashCode ^
      rewardUrl.hashCode;
}
