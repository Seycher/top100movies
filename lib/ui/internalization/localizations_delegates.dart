import 'package:applaca/ui/internalization/supported_languages.dart';
import 'package:flutter/material.dart';

import 'locales.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kSupportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(final LocalizationsDelegate<AppLocalizations> old) => false;
}
