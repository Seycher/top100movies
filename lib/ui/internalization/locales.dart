import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'I10n/messages_all.dart';

class AppLocalizations {
  final String _localName;

  AppLocalizations(this._localName);

  static Future<AppLocalizations> load(final Locale locale) {
    final localeName = _extractLocaleName(locale);

    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(final BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get applicationTitle {
    return Intl.message(
      'top100',
      name: 'applicationTitle',
      locale: _localName,
    );
  }

  static String _extractLocaleName(final Locale locale) {
    final countryCodeAvailable = locale.countryCode?.isNotEmpty ?? false;
    final name = countryCodeAvailable ? locale.toString() : locale.languageCode;
    return Intl.canonicalizedLocale(name);
  }
}
