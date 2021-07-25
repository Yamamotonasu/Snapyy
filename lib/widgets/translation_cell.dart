import 'package:flutter/material.dart';
import 'package:snappy/widgets/copy_button.dart';

class TranslationCell extends StatelessWidget {

  final String displayTitle;

  final String translationText;

  TranslationCell({required this.displayTitle, required this.translationText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(displayTitle, style: Theme.of(context).textTheme.bodyText1),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SelectableText(
                    translationText,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: CopyButton(copyText: translationText)
              )
            ],
          )
        ],
      ) 
    );
  }

}