import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// LocalizationManager is a class that manages localization.
final class LocalizationManager extends EasyLocalization {
  /// This is a class contructor that manages localization.
  LocalizationManager({required super.child, super.key})
      : super(
          supportedLocales: supportedLocaleList,
          path: _translationPath,
          startLocale: LocaleEnums.en.locale,
        );

  static const String _translationPath = 'assets/translations';

  /// This is a list of supported languages.
  static final List<Locale> supportedLocaleList = [
    LocaleEnums.en.locale,
    LocaleEnums.tr.locale,
    LocaleEnums.ar.locale,
    LocaleEnums.fr.locale,
    LocaleEnums.it.locale,
    LocaleEnums.ru.locale,
    LocaleEnums.es.locale,
  ];
}

/// This is an enum for supported languages
/// and their locale variables
/// if you want to add a new language,
/// you must add it to this enum
enum LocaleEnums {
  /// English
  en(Locale('en', 'US')),

  /// Turkish
  tr(Locale('tr', 'TR')),

  /// German
  de(Locale('de', 'DE')),

  /// Arabic
  ar(Locale('ar', 'AR')),

  /// Azerbaijani
  az(Locale('az', 'AZ')),

  /// Belarusian
  be(Locale('be', 'BY')),

  /// Bulgarian
  bg(Locale('bg', 'BG')),

  /// Japanese
  ja(Locale('ja', 'JP')),

  /// Korean
  ko(Locale('ko', 'KR')),

  /// Russian
  ru(Locale('ru')),

  /// Chinese
  zh(Locale('zh', 'CN')),

  /// Spanish
  es(Locale('es')),

  /// French
  fr(Locale('fr', 'FR')),

  /// Italian
  it(Locale('it')),

  /// Portuguese
  pt(Locale('pt', 'PT')),

  /// Ukrainian
  uk(Locale('uk', 'UA')),

  /// Vietnamese
  vi(Locale('vi', 'VN')),
  ;

  const LocaleEnums(this.locale);

  /// This is a locale variable.
  final Locale locale;
}
