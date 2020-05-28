import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_event.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/repository/movie.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:applaca/ui/pages/bottom_navigation_bar.dart';
import 'package:applaca/ui/pages/list_of_movies/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listOfMoviesBloc = BlocProvider.of<ListOfMoviesBloc>(context);
    return BlocBuilder<ListOfMoviesBloc, ListOfMoviesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _listAppBar(listOfMoviesBloc, state),
          body: _listBody(listOfMoviesBloc, state),
          bottomNavigationBar: BottomNavigation(listOfMoviesBloc, 1),
        );
      },
    );
  }

  Widget _listAppBar(
    final ListOfMoviesBloc listOfMoviesBloc,
    final ListOfMoviesState state,
  ) {
    if (state is MoviesAvailableState) {
      final watchedMovies =
          state.listOfMovies.where((item) => item.isScratched == true).length;
      return AppBar(
        title: Text(
          "film do oglądania", //TODO: Podmiana na nazwe wylosowanego filmu
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.play_circle_outline),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Center(
            child: Text(
              '$watchedMovies' + '/100',
              style: appBarTextStyle,
            ),
          ),
          SizedBox(width: 20),
        ],
      );
    } else {
      return AppBar(backgroundColor: Colors.black);
    }
  }

  Widget _listBody(
    final ListOfMoviesBloc listOfMoviesBloc,
    final ListOfMoviesState state,
  ) {
    if (state is InitialListOfMoviesState) {
      listOfMoviesBloc.add(ListenMoviesEvent());
    } else if (state is MoviesAvailableState) {
      return _moviesAvailableWidget(listOfMoviesBloc, state.listOfMovies);
    } else if (state is NoMoviesAvailableState) {
      return _moviesNoAvailableWidget();
    }
  }

  Widget _moviesAvailableWidget(
    final ListOfMoviesBloc listOfMoviesBloc,
    final List<Movie> listOfMovies,
  ) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final movie = listOfMovies[index];
        return MovieTile(
          title: movie.title,
          year: movie.year,
          isScratched: movie.isScratched,
          duration: movie.duration,
          category: movie.category,
          posterUrl: movie.posterUrl,
          rewordUrl: movie.rewordUrl,
          time: movie.time,
          onMovieClick: () {
            listOfMoviesBloc.add(MovieClickedEvent(movie.title));
          },
        );
      },
      itemCount: listOfMovies.length,
    );
  }

  Widget _moviesNoAvailableWidget() {
    return Container(color: Colors.black);
  }
}
