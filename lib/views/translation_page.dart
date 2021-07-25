import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/view_models/translate_view_model.dart';
import 'package:snappy/widgets/translation_cell.dart';

class TranslationPage extends HookWidget {

  static const routeName = '/translation_detail';

  final String translationText;

  TranslationPage({required this.translationText});

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(translateViewModelNotifier.notifier);
    final state = useProvider(translateViewModelNotifier);

    useEffect(() {
      provider.execTranslate(translationText);
    }, const []);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.instance.text('translation'), style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TranslationCell(displayTitle: AppLocalizations.instance.text('detected_text'), translationText: translationText),
              SizedBox(height: 20),
              TranslationCell(displayTitle: AppLocalizations.instance.text('translation_from_japanese'), translationText: state),
              SizedBox(height: 20),
            ],
          )
        )
      )
    );
  }

}