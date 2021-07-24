import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snappy/utils/localization.dart';

class CopyButton extends StatelessWidget {

  final String copyText;

  CopyButton({required this.copyText});

  Future<void> onTapCopyButton({required String copyText, required BuildContext context}) async {
    final copyData = ClipboardData(text: copyText);
    await Clipboard.setData(copyData);
    final copyedText = AppLocalizations.instance.text('copyed');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$copyText $copyedText", style: Theme.of(context).textTheme.headline4),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
        label: AppLocalizations.instance.text('confirm'),
        onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(() => onTapCopyButton(copyText: copyText, context: context), context),
      child: Image(
        image: AssetImage('lib/assets/copy_icon.png'),
        width: 30,
        height: 45,
      ),
    );
  }

}