import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_state.dart';
import 'package:applaca/ui/screens/draw_movie/views/challenge_accepted.dart';
import 'package:applaca/ui/screens/draw_movie/views/draw_home.dart';
import 'package:applaca/ui/screens/draw_movie/views/draw_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class DrawMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _drawMovieBloc = BlocProvider.of<DrawMovieBloc>(context);

    return BlocBuilder<DrawMovieBloc, DrawMovieState>(
      builder: (context, state) {
        return _resolveState(
          _drawMovieBloc,
          state,
          context,
        );
      },
    );
  }

  _resolveState(
    final DrawMovieBloc bloc,
    final DrawMovieState state,
    final BuildContext context,
  ) {
    if (state is InitialDrawMovieState) {
      return buildDrawHomeView(bloc, context);
    } else if (state is MovieDrawnState) {
      return buildDrawnMovieView(bloc, state, context);
    } else if (state is ChallengeAcceptedState) {
      return buildChallengeAcceptedView(bloc, state, context);
    }

    Logger().e('Unknown DrawMovieState: ${state.runtimeType}.'
        ' Returning red Container');

    return Container(color: Colors.red);
  }
}
