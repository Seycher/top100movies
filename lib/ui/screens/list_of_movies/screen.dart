import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/ui/screens/app_components/bottom_navigation_bar.dart';
import 'package:applaca/ui/screens/app_components/loading_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'components/list_of_movies.dart';
import 'components/list_of_movies_appbar.dart';

class ListOfMoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listOfMoviesBloc = BlocProvider.of<ListOfMoviesBloc>(context);
    return BlocBuilder<ListOfMoviesBloc, ListOfMoviesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: listAppBar(listOfMoviesBloc, state, context),
          body: _resolveState(listOfMoviesBloc, state),
          bottomNavigationBar: BottomNavigation(1),
        );
      },
    );
  }

  Widget _resolveState(
    final ListOfMoviesBloc listOfMoviesBloc,
    final ListOfMoviesState state,
  ) {
    if (state is InitialListOfMoviesState) {
      listOfMoviesBloc.add(ScreenInitializedEvent());

      return buildLoadingIndicatorView();
    } else if (state is MoviesAvailableState) {
      return listOfMovies(
        listOfMoviesBloc,
        state.listOfMovies,
      );
    } else if (state is NoMoviesAvailableState) {
      return buildLoadingIndicatorView();
    }

    Logger().e('Unknown RewardState: ${state.runtimeType}.'
        ' Returning red Containter');

    return Container(color: Colors.red);
  }
}
