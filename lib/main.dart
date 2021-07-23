import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/themes/theme.dart';


import 'package:snappy/utils/localization.dart';
import 'package:snappy/view_models/select_how_to_view_model.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      theme: Themes.lightThemeData,
      darkTheme: Themes.darkThemeData,
      home: SelectHowTo(),
    );
  }
}

class SelectHowTo extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(selectHowToViewModelProvider.notifier);
    final provider = useProvider(selectHowToViewModelProvider);
    print(provider);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('私の名前は宇宙人だ！', style: Theme.of(context).primaryTextTheme.button),
            ElevatedButton(
              child: const Text('Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () => viewModel.setIsLoading(),
            ),          
          ]
        )
      )
    );
  }

}
