import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_state.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget listAppBar(
  final ListOfMoviesBloc listOfMoviesBloc,
  final ListOfMoviesState state,
  final BuildContext context,
) {
  if (state is MoviesAvailableState) {
    final watchedMoviesNumber =
        state.listOfMovies.where((movie) => movie.isUnlocked == true).length;

    return AppBar(
      title: Text(
        state.title != null
            ? state.title
            : AppLocalizations.of(context).translate(LocalizedStrings.Title),
        style: kAppBarTextStyle,
      ),
      leading: Icon(Icons.play_circle_outline),
      backgroundColor: Colors.black,
      actions: <Widget>[
        Center(
          child: Text(
            '$watchedMoviesNumber' + '/100',
            style: kAppBarTextStyle,
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  } else {
    return null;
  }
}
