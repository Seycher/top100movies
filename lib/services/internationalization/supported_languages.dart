import 'package:flutter/material.dart';

const Iterable<Locale> kSupportedLangWithCountryCode = [
  const Locale.fromSubtags(
    languageCode: kLanguageCodeEN,
    countryCode: kCountryCodeEN,
  ),
  const Locale.fromSubtags(
    languageCode: kLanguageCodePL,
    countryCode: kCountryCodePL,
  ),
];
const kLanguageCodeEN = 'en';
const kLanguageCodePL = 'pl';
const kCountryCodeEN = 'EN';
const kCountryCodePL = 'PL';
