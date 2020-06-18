import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:applaca/ui/screens/app_components/responsive_scaffold.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kTimerH = 0.089;
const kTimerW = 0.7;
const kBottomTextH = 0.03;

Widget buildChallengeMessage(
  final BuildContext context,
  final Duration leftTime,
  final SizeInformation constrains,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AutoSizeText(
              AppLocalizations.of(context).translate(LocalizedStrings
                  .Draw_Movie_Challenge_Accepted_Top_Timer_Text),
              maxLines: 1,
              style: kTimerWhiteTextStyle,
            ),
            Container(
              height: constrains.height * kTimerH,
              width: constrains.width * kTimerW,
              child: _buildTimer(leftTime),
            ),
          ],
        ),
        AutoSizeText(
          AppLocalizations.of(context).translate(LocalizedStrings
              .Draw_Movie_Challenge_Accepted_Bottom_Timer_Text),
          maxLines: 1,
          style: kTimerWhiteTextStyle,
        )
      ],
    ),
  );
}

Widget _buildTimer(final Duration leftTime) {
  return Countdown(
    duration: leftTime,
    builder: (BuildContext context, Duration duration) {
      return Text(
        '${duration.inHours} '
        '${AppLocalizations.of(context).translate(
          LocalizedStrings.Draw_Movie_Challenge_Accepted_Center_Timer_Hours,
        )}',
        maxLines: 1,
        style: kMovieTitleTextStyle,
      );
    },
  );
}
