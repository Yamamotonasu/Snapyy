import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';


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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectHowTo(),
    );
  }
}

class SelectHowTo extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(selectHowToViewModelProvider.notifier);
    final provider = useProvider(selectHowToViewModelProvider);
    return Container(
      color: Color(0xFFD8F2DE),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(provider.isLoading.toString()),
            ElevatedButton(
              child: const Text('Select Library Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () => viewModel.selectLibrary(ImageSource.gallery),
            ),
            ElevatedButton(
              child: const Text('Select Camera Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () => viewModel.selectLibrary(ImageSource.camera),
            ),
                    
          ]
        )
      )
    );
  }

}
