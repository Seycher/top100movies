import 'package:applaca/repository/movie.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesEvent {
  const ListOfMoviesEvent();
}

class PrizeUnlockedEvent extends ListOfMoviesEvent {
  final Movie movie;

  const PrizeUnlockedEvent(this.movie);
}

class ScreenInitializedEvent extends ListOfMoviesEvent {
  final List<Movie> listOfMovies;

  const ScreenInitializedEvent(this.listOfMovies);
}

class MovieClickedEvent extends ListOfMoviesEvent {
  final String title;

  const MovieClickedEvent(this.title);
}

class ListenMoviesEvent extends ListOfMoviesEvent {
  const ListenMoviesEvent();
}

class LotteryIconClickedEvent extends ListOfMoviesEvent {
  const LotteryIconClickedEvent();
}
