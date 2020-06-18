import 'dart:convert';

import 'package:applaca/services/internationalization/supported_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _jsonMap;

  Future<void> load() async {
    final String jsonString = await rootBundle.loadString(
      'lang/${locale.languageCode}.json',
    );

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _jsonMap = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => _jsonMap[key];

  static Locale localeResolutionCallback(locale, supportedLocales) {
    for (var supLocale in supportedLocales) {
      if (supLocale.languageCode == locale.languageCode &&
          supLocale.countryCode == locale.countryCode) {
        return supLocale;
      }
    }
    return supportedLocales.firstWhere(
      (element) => element.languageCode == kLanguageCodeEN,
    );
  }
}
