import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app_localizations.dart';
import 'supported_languages.dart';

@lazySingleton
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      kLanguageCodeEN,
      kLanguageCodePL,
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
