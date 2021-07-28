import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/view_models/select_how_to_view_model.dart';
import 'package:snappy/views/translation_page.dart';
import 'package:snappy/widgets/copy_button.dart';
import 'package:snappy/widgets/empty_text_view.dart';

class FullTextPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final state = useProvider(selectHowToViewModelProvider);
    final displayText = state.detectedTexts.join('\n');
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: !state.hasEnglishText ? EmptyTextView() : Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () => Feedback.wrapForTap(() => Navigator.of(context).pushNamed(TranslationPage.routeName, arguments: displayText), context),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SelectableText(
                  displayText,
                  style: Theme.of(context).textTheme.bodyText1
                )
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('翻訳', style: Theme.of(context).textTheme.headline4),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: Feedback.wrapForTap(() => Navigator.of(context).pushNamed(TranslationPage.routeName, arguments: displayText), context),
                  ),
                  CopyButton(copyText: displayText)   
                ],
              )
            )
          )
        ],
      )
    );
  }

}