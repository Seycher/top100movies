import 'package:applaca/database/database.dart';

class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final bool isScratched;

  Movie(this.id, this.title, this.posterUrl, this.isScratched);

  static Movie fromMoor(final MoorMovie moorMovies) {
    return Movie(
      moorMovies.id,
      moorMovies.title,
      moorMovies.posterUrl,
      moorMovies.isScratched,
    );
  }
}
