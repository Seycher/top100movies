import 'package:applaca/repository/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesEvent extends Equatable {
  const ListOfMoviesEvent();
}

class PrizeUnlockedEvent extends ListOfMoviesEvent {
  final Movie movie;

  const PrizeUnlockedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}

class ScreenInitializedEvent extends ListOfMoviesEvent {
  final List<Movie> listOfMovies;

  const ScreenInitializedEvent(this.listOfMovies);

  @override
  List<Object> get props => [listOfMovies];
}

class MovieClickedEvent extends ListOfMoviesEvent {
  final String title;

  const MovieClickedEvent(this.title);

  @override
  List<Object> get props => [title];
}

class ListenMoviesEvent extends ListOfMoviesEvent {
  const ListenMoviesEvent();

  @override
  List<Object> get props => [];
}

class LotteryIconClickedEvent extends ListOfMoviesEvent {
  const LotteryIconClickedEvent();

  @override
  List<Object> get props => [];
}