import 'package:applaca/repository/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesState extends Equatable {
  const ListOfMoviesState();
}

class InitialListOfMoviesState extends ListOfMoviesState {
  const InitialListOfMoviesState();

  @override
  List<Object> get props => [];
}

class MoviesAvailableState extends ListOfMoviesState {
  final List<Movie> listOfMovies;

  const MoviesAvailableState(this.listOfMovies);

  @override
  List<Object> get props => [listOfMovies];
}

class NoMoviesAvailableState extends ListOfMoviesState {
  const NoMoviesAvailableState();

  @override
  List<Object> get props => [];
}
