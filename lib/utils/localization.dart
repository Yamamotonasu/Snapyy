import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {

  static final AppLocalizations instance = AppLocalizations._internal();
  factory AppLocalizations() => instance;
  AppLocalizations._internal();

  late Map<dynamic, dynamic> _localisedValues;

  Future<AppLocalizations> load(Locale locale) async {
    String jsonContent =
      await rootBundle.loadString("lib/assets/locale/localization_${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent) as Map<dynamic, dynamic>;
    return this;
  }

  String text(String key) {
    return _localisedValues[key] as String;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ja', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale)  {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}