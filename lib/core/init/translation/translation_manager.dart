import 'package:flutter/material.dart';

class TranslationManager {
  TranslationManager._init();
  static TranslationManager? _instance;
  static TranslationManager? get instance {
    return _instance ??= TranslationManager._init();
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
