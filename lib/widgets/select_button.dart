import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {

  final String assetPath;

  final String displayText;
  
  final void Function() onTap;

  SelectButton({required this.assetPath, required this.displayText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(onTap, context),
      child: Column(
        children: [
          Image(
            image: AssetImage(assetPath),
            width: 100,
            height: 100,
          ),
          Text(
            displayText,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      )
    );
  }

}