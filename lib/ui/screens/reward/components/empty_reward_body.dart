import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EmptyRewardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Text(
            AppLocalizations.of(context)
                .translate(LocalizedStrings.Reward_Screen_No_Data_Error),
            textAlign: TextAlign.center,
            style: kMovieDetailsErrorTextStyle,
          ),
        ),
      ),
    );
  }
}
