import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/themes/theme.dart';

import 'package:snappy/utils/localization.dart';
import 'package:snappy/utils/snappy_share_preference.dart';
import 'package:snappy/views/result_tab.dart';
import 'package:snappy/views/select_how_to.dart';
import 'package:snappy/views/translation_page.dart';

void main() {
  runApp(ProviderScope(child: Snappy()));
}

class Snappy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SnappySharePreference().setValue();
    return MaterialApp(
      title: 'Snappy',
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''),
        const Locale('en', '')
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode ||
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
      },
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case ResultTab.routeName:
            return MaterialPageRoute<void>(builder: (context) => ResultTab());
          case TranslationPage.routeName:
            return MaterialPageRoute<void>(builder: (context) => TranslationPage(translationText: settings.arguments as String));
        }
      },
      theme: Themes.lightThemeData,
      darkTheme: Themes.darkThemeData,
      home: SelectHowTo(),
    );
  }
}
