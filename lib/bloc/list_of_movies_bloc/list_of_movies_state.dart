import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesState {
  const ListOfMoviesState();
}

class InitialListOfMoviesState extends ListOfMoviesState {
  const InitialListOfMoviesState();
}

class ReloadedListOfMovieState extends ListOfMoviesState {
  const ReloadedListOfMovieState();
}
