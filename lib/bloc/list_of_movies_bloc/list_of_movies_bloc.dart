import 'dart:async';

import 'package:bloc/bloc.dart';

import 'list_of_movies_event.dart';
import 'list_of_movies_state.dart';

class ListOfMoviesBloc extends Bloc<ListOfMoviesEvent, ListOfMoviesState> {
  @override
  ListOfMoviesState get initialState => InitialListOfMoviesState();

  @override
  Stream<ListOfMoviesState> mapEventToState(
    ListOfMoviesEvent event,
  ) async* {
    if (event is ScratchTheMovieEvent) {
      await _scratchTheMovie(event);
    }
  }

  Future<ListOfMoviesState> _scratchTheMovie(
    ScratchTheMovieEvent event,
  ) async {
    // TODO: logika zdrapywania filmu
    return MoviesAvailableState();
  }
}
