import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget buildAppbar(final BuildContext context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context).translate(LocalizedStrings.Title),
      style: TextStyle(color: Colors.white),
    ),
    leading: Icon(Icons.play_circle_outline),
    backgroundColor: Colors.black,
    actions: <Widget>[
      Center(
        child: Text(
          '0' + '/100',
          style: kAppBarTextStyle,
        ),
      ),
      SizedBox(width: 16),
    ],
  );
}
