import 'package:applaca/model/movie.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesState {
  const ListOfMoviesState();
}

class InitialListOfMoviesState extends ListOfMoviesState {
  const InitialListOfMoviesState();
}

class MoviesAvailableState extends ListOfMoviesState {
  final List<Movie> listOfMovies;

  const MoviesAvailableState(this.listOfMovies);
}

class NoMoviesAvailableState extends ListOfMoviesState {
  const NoMoviesAvailableState();
}
