import 'package:flutter/material.dart';
import 'package:snappy/widgets/copy_button.dart';
import 'package:snappy/widgets/empty_text_view.dart';

class FullTextPage extends StatelessWidget {

  final String displayText = 'これをコピーしてください。\nこれをコピーしてください。\nこれをコピーしてください';

  // For test
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: isEmpty ? EmptyTextView() : Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SelectableText(
                displayText,
                style: Theme.of(context).textTheme.bodyText1
              )
            )
          ),
          Expanded(
            child: CopyButton(copyText: displayText)
          )
        ],
      )
    );
  }

}