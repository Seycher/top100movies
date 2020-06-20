import 'package:applaca/bloc/draw_movie_bloc/draw_movie_bloc.dart';
import 'package:applaca/bloc/draw_movie_bloc/draw_movie_event.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/screens/app_components/bottom_navigation.dart';
import 'package:applaca/ui/screens/app_components/button.dart';
import 'package:applaca/ui/screens/app_components/responsive_scaffold.dart';
import 'package:applaca/ui/screens/draw_movie/components/shuffle_home_appbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

const kButtonH = 0.086;
const kButtonW = 0.94;
const kTextH = 0.16;
const kTextW = 0.8;

Widget buildDrawHomeView(
  final DrawMovieBloc bloc,
  final BuildContext context,
) {
  return ResponsiveScaffold(
    appBar: buildAppbar(context),
    builder: (context, constrains) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        width: constrains.width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: constrains.height * kTextH,
              width: constrains.width * kTextW,
              child: AutoSizeText(
                AppLocalizations.of(context)
                    .translate(LocalizedStrings.Draw_Movie_Draw_Home_Home),
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
            Container(
              width: constrains.width * kButtonW,
              height: constrains.height * kButtonH,
              child: buildButton(
                fontSize: 27,
                color: Colors.pink,
                text: AppLocalizations.of(context)
                    .translate(LocalizedStrings.Draw_Movie_Draw_Home_Button),
                function: () => bloc.add(ShuffleButtonPressedEvent()),
              ),
            ),
          ],
        ),
      );
    },
    bottomNavigationBar: BottomNavigation(currentIndex: 0),
  );
}
