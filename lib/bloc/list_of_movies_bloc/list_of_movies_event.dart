import 'package:meta/meta.dart';

@immutable
abstract class ListOfMoviesEvent {
  const ListOfMoviesEvent();
}

class ScratchTheMovieEvent extends ListOfMoviesEvent {
  const ScratchTheMovieEvent();
}
