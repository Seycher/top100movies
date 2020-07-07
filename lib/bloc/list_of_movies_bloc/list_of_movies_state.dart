import 'package:applaca/repository/model/movie.dart';
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
  final String title;

  const MoviesAvailableState(this.listOfMovies, this.title);

  @override
  List<Object> get props => [listOfMovies, title];
}

class NoMoviesAvailableState extends ListOfMoviesState {
  const NoMoviesAvailableState();

  @override
  List<Object> get props => [];
}
