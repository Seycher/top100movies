import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_event.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_state.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:applaca/ui/screens/app_components/bottom_navigation.dart';
import 'package:applaca/ui/screens/app_components/button.dart';
import 'package:applaca/ui/screens/app_components/responsive_scaffold.dart';
import 'package:applaca/ui/screens/draw_movie/components/challenge_message.dart';
import 'package:applaca/ui/screens/draw_movie/components/poster.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

const kPosterH = 0.35;
const kPosterW = 1;
const kButtonH = 0.074;
const kButtonW = 0.94;
const kPlotH = 0.08;

Widget buildChallengeAcceptedView(
  final DrawMovieBloc bloc,
  final ChallengeAcceptedState state,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildPoster(
              state.posterUrl,
              constrains.height * kPosterH,
              constrains.width * kPosterW,
            ),
            _buildMovieDetails(state, constrains),
            buildChallengeMessage(context, state.timeLeft, constrains),
            Center(
              child: Container(
                height: constrains.height * kButtonH,
                width: constrains.width * kButtonW,
                child: buildButton(
                  fontSize: 27,
                  color: Colors.pink,
                  text: AppLocalizations.of(context).translate(LocalizedStrings
                      .Draw_Movie_Challenge_Accepted_Finish_Button),
                  function: () {
                    bloc.add(ChallengeCompletedButtonPressedEvent());
                  },
                ),
              ),
            ),
            _buildResignationButton(bloc, context),
          ],
        ),
      );
    },
    bottomNavigationBar: BottomNavigation(currentIndex: 0),
  );
}

Widget _buildMovieDetails(
  final ChallengeAcceptedState state,
  final SizeInformation constrains,
) {
  return Opacity(
    opacity: 0.4,
    child: Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                state.title,
                maxLines: 1,
                style: kMovieAcceptedTitleTextStyle,
              ),
              AutoSizeText(
                state.category,
                maxLines: 1,
                style: kDetailTextStyle,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                '${state.year}',
                maxLines: 1,
                style: kDetailTextStyle,
              ),
              AutoSizeText(
                '${state.duration ~/ 60}H ${state.duration % 60}MIN',
                maxLines: 1,
                style: kDetailTextStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 24),
            child: Container(
              height: constrains.height * kPlotH,
              child: AutoSizeText(
                state.plot,
                minFontSize: 11,
                style: kNormalWhiteTextStyle,
                maxLines: 4,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildResignationButton(
  final DrawMovieBloc bloc,
  final BuildContext context,
) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Opacity(
      opacity: 0.4,
      child: FlatButton(
        onPressed: () => bloc.add(ResignationButtonPressedEvent()),
        child: AutoSizeText(
          AppLocalizations.of(context).translate(LocalizedStrings
              .Draw_Movie_Challenge_Accepted_Resignation_Button),
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    ),
  );
}
