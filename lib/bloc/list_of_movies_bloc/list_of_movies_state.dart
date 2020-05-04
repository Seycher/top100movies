import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesState {
  const ListOfMoviesState();
}

class InitialListOfMoviesState extends ListOfMoviesState {
  const InitialListOfMoviesState();
}

class MoviesAvailableState extends ListOfMoviesState {
  const MoviesAvailableState();
}
