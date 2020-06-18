import 'package:applaca/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:applaca/bloc/no_state.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/ui/screens/draw_movie/navigation.dart';
import 'package:applaca/ui/screens/list_of_movies/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, NoState> {
  final GlobalKey<NavigatorState> _navigator;
  final SharedPreferencesRepository _sharedPreferences;

  BottomNavigationBarBloc(this._navigator, this._sharedPreferences);

  @override
  NoState get initialState => NoState();

  @override
  Stream<NoState> mapEventToState(final BottomNavigationBarEvent event) {
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
