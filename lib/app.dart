import 'package:applaca/services/internationalization/app_localizations_delegate.dart';
import 'package:applaca/services/internationalization/supported_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'services/dependency_injection/injection.dart';
import 'services/internationalization/app_localizations.dart';
import 'ui/pages/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'top100',
      theme: ThemeData(primarySwatch: Colors.blue),
      supportedLocales: kSupportedLangWithCountryCode,
      localizationsDelegates: [
        getIt<AppLocalizationsDelegate>(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: AppLocalizations.localeResolutionCallback,
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      home: Home(),
    );
  }
}
