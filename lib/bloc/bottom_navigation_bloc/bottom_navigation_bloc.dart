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
    if (event is DrawMovieButtonPressedEvent) {
      _onLotteryButtonClicked(event.currentIndex);
    } else if (event is ListButtonClickedEvent) {
      _onListButtonClicked(event.currentIndex);
    }
  }

  void _onLotteryButtonClicked(final currentIndex) {
    if (currentIndex == 1) {
      _navigator.currentState.pushReplacement(DrawMovieRoute.get());
    }
  }

  void _onListButtonClicked(final currentIndex) {
    if (currentIndex == 0) {
      _navigator.currentState.pushReplacement(ListOfMoviesRoute.get());
    }
  }
}
