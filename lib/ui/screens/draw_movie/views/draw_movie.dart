import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_event.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_state.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:applaca/ui/screens/app_components/bottom_navigation.dart';
import 'package:applaca/ui/screens/app_components/button.dart';
import 'package:applaca/ui/screens/app_components/responsive_scaffold.dart';
import 'package:applaca/ui/screens/draw_movie/components/poster.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

const kPosterH = 0.35;
const kPosterW = 1;
const kButtonH = 0.074;
const kButtonW = 0.4;
const kIcon = 0.085;

Widget buildDrawnMovieView(
  final DrawMovieBloc bloc,
  final MovieDrawnState state,
  final BuildContext context,
) {
  return ResponsiveScaffold(
    builder: (context, constrains) {
      return Container(
        color: Colors.black,
        width: constrains.width,
        height: constrains.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildPoster(
              state.posterUrl,
              constrains.height * kPosterH,
              constrains.width * kPosterW,
            ),
            _buildDrawAgainButton(bloc, constrains),
            _buildMovieDetails(state, constrains),
            _buildButtons(context, bloc, constrains),
          ],
        ),
      );
    },
    bottomNavigationBar: BottomNavigation(currentIndex: 0),
  );
}

Widget _buildDrawAgainButton(
  final DrawMovieBloc bloc,
  final SizeInformation constrains,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => bloc.add(DrawAgainButtonPressedEvent()),
        child: Icon(
          Icons.refresh,
          color: Colors.white,
          size: constrains.width * kIcon,
        ),
      ),
    ),
  );
}

Widget _buildMovieDetails(
  final MovieDrawnState state,
  final SizeInformation constrains,
) {
  return Column(
    children: <Widget>[
      AutoSizeText(
        state.title,
        maxLines: 1,
        style: kMovieTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AutoSizeText(
              state.director,
              maxLines: 1,
              style: kDetailTextStyle,
            ),
            AutoSizeText(
              state.category,
              maxLines: 1,
              style: kDetailTextStyle,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AutoSizeText(
              '${state.year}',
              style: kDetailTextStyle,
            ),
            AutoSizeText(
              '${state.duration ~/ 60}H ${state.duration % 60}MIN',
              style: kDetailTextStyle,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: AutoSizeText(
          state.plot,
          maxLines: 5,
          style: kNormalWhiteTextStyle,
        ),
      ),
    ],
  );
}

Widget _buildButtons(
  final BuildContext context,
  final DrawMovieBloc bloc,
  final SizeInformation constrains,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: constrains.width * kButtonW,
          height: constrains.height * kButtonH,
          child: buildButton(
            fontSize: 27,
            color: Colors.grey[800],
            text: AppLocalizations.of(context)
                .translate(LocalizedStrings.Draw_Movie_Draw_Movie_Saw_Button),
            function: () => bloc.add(SawItButtonPressedEvent()),
          ),
        ),
        SizedBox(width: 24),
        Container(
          width: constrains.width * kButtonW,
          height: constrains.height * kButtonH,
          child: buildButton(
            fontSize: 27,
            color: Colors.pink,
            text: AppLocalizations.of(context).translate(
                LocalizedStrings.Draw_Movie_Draw_Movie_Accept_Button),
            function: () {
              bloc.add(ChallengeAcceptedButtonPressedEvent());
            },
          ),
        ),
      ],
    ),
  );
}
