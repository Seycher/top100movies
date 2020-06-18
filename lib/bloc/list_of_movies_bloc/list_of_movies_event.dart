import 'package:applaca/repository/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesEvent extends Equatable {
  const ListOfMoviesEvent();
}

class DataReceivedEvent extends ListOfMoviesEvent {
  final List<Movie> listOfMovies;

  const DataReceivedEvent(this.listOfMovies);

  @override
  List<Object> get props => [listOfMovies];
}

class MovieClickedEvent extends ListOfMoviesEvent {
  final String title;

  const MovieClickedEvent(this.title);

  @override
  List<Object> get props => [title];
}

class ScreenInitializedEvent extends ListOfMoviesEvent {
  const ScreenInitializedEvent();

  @override
  List<Object> get props => [];
}
