import 'package:applaca/services/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/internalization/locales.dart';
import 'ui/internalization/localizations_delegates.dart';
import 'ui/internalization/supported_languages.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).applicationTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: kSupportedLocales,
      nnavigatorKey: getIt<GlobalKey<NavigatorState>>(),
      home: Home(),
    );
  }
}
