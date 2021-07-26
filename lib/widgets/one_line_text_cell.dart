import 'package:flutter/material.dart';
import 'package:snappy/views/translation_page.dart';
import 'package:snappy/widgets/copy_button.dart';

class OneLineTextCell extends StatelessWidget {

  final String displayText;

  OneLineTextCell({required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 9),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: Feedback.wrapForTap(() => Navigator.of(context).pushNamed(TranslationPage.routeName, arguments: displayText), context),
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(displayText, style: Theme.of(context).textTheme.bodyText1),
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: CopyButton(copyText: displayText),
              ),
            ]
          ),
          const SizedBox(height: 9)
        ],
      )
    );
  }

}