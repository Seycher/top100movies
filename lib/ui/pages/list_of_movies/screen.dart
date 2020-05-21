import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/ui/common/constants/style_constants.dart';
import 'package:applaca/ui/pages/list_of_movies/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listOfMoviesBloc = BlocProvider.of<ListOfMoviesBloc>(context);
    return BlocBuilder<ListOfMoviesBloc, ListOfMoviesState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: <Widget>[
              _listAppBar(listOfMoviesBloc, context),
              _listBody(listOfMoviesBloc, state)
            ],
          ),
        );
      },
    );
  }

  Widget _listAppBar(
    final ListOfMoviesBloc listOfMoviesBloc,
    context,
  ) {
    return SliverAppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.rotate_90_degrees_ccw),
          onPressed: () {
            listOfMoviesBloc.add(LotteryIconClickedEvent());
          },
        ),
      ],
    );
  }

  Widget _listBody(
    final ListOfMoviesBloc listOfMoviesBloc,
    final ListOfMoviesState state,
  ) {
    if (state is InitialListOfMoviesState) {
      listOfMoviesBloc.add(ListenMoviesEvent());
      return SliverToBoxAdapter(
        child: Container(),
      );
    } else if (state is MoviesAvailableState) {
      return SliverPadding(
        padding: const EdgeInsets.all(kPaddingSmall),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final movie = state.listOfMovies[index];
              return MovieTile(
                movieTitle: movie.title,
                isUnlocked: movie.isUnlocked,
                posterUrl: movie.posterUrl,
                onClick: () {
                  listOfMoviesBloc.add(MovieClickedEvent(movie.title));
                },
              );
            },
            childCount: state.listOfMovies.length,
          ),
        ),
      );
    } else if (state is NoMoviesAvailableState) {
      return SliverToBoxAdapter(
        child: Container(),
      );
    }
  }
}
