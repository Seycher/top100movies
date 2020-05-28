import 'package:applaca/database/database.dart';

class Movie {
  final int id;
  final String title;
  final int year;
  final String category;
  final String director;
  final int duration;
  final String plot;
  final String encouragement;
  final DateTime time;
  final String posterUrl;
  final String rewordUrl;
  final bool isScratched;

  //TODO if you make any changes with values remember about generating new toString, and equals

  Movie(
    this.id,
    this.title,
    this.year,
    this.category,
    this.director,
    this.duration,
    this.plot,
    this.encouragement,
    this.time,
    this.posterUrl,
    this.rewordUrl,
    this.isScratched,
  );

  static Movie fromMoor(final MoorMovie moorMovies) {
    return Movie(
      moorMovies.id,
      moorMovies.title,
      moorMovies.year,
      moorMovies.category,
      moorMovies.director,
      moorMovies.duration,
      moorMovies.plot,
      moorMovies.encouragement,
      moorMovies.watchedDate,
      moorMovies.posterUrl,
      moorMovies.rewordUrl,
      moorMovies.isScratched,
    );
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, year: $year, category: $category, director: $director, duration: $duration, plot: $plot, encouragement: $encouragement, time: $time, posterUrl: $posterUrl, rewordUrl: $rewordUrl, isScratched: $isScratched}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          year == other.year &&
          category == other.category &&
          director == other.director &&
          duration == other.duration &&
          plot == other.plot &&
          encouragement == other.encouragement &&
          time == other.time &&
          posterUrl == other.posterUrl &&
          rewordUrl == other.rewordUrl &&
          isScratched == other.isScratched;

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
      time.hashCode ^
      posterUrl.hashCode ^
      rewordUrl.hashCode ^
      isScratched.hashCode;
}