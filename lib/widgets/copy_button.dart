import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {

  final String copyText;

  CopyButton({required this.copyText});

  Future<void> onTapCopyButton({required String copyText}) async {
    final copyData = ClipboardData(text: copyText);
    await Clipboard.setData(copyData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(() => onTapCopyButton(copyText: copyText), context),
      child: Image(
        image: AssetImage('lib/assets/copy_icon.png'),
        width: 30,
        height: 45,
      ),
    );
  }

}