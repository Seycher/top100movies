import 'package:applaca/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:applaca/bloc/no_state.dart';
import 'package:applaca/ui/screens/draw_movie/navigation.dart';
import 'package:applaca/ui/screens/list_of_movies/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, NoState> {
  final GlobalKey<NavigatorState> _navigator;

  BottomNavigationBloc(this._navigator);

  @override
  NoState get initialState => NoState();

  @override
  Stream<NoState> mapEventToState(final BottomNavigationEvent event) async* {
    if (event is LotteryButtonClickedEvent) {
      _onLotteryButtonClicked();
    } else if (event is ListButtonClickedEvent) {
      _onListButtonClicked();
    }
  }

  void _onLotteryButtonClicked() {
    _navigator.currentState.pushReplacement(DrawMovieRoute.get());
  }

  void _onListButtonClicked() {
    _navigator.currentState.pushReplacement(ListOfMoviesRoute.get());
  }
}
