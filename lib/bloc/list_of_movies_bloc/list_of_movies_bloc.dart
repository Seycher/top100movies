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
    // TODO: Add Logic
  }
}
