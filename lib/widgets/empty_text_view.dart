import 'package:flutter/material.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/widgets/select_button.dart';

class EmptyTextView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.5,
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage('lib/assets/close_eye_snappy.png'),
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(AppLocalizations.instance.text('text_not_found'), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SelectButton(
                  assetPath: 'lib/assets/camera_icon.png',
                  displayText: AppLocalizations.instance.text('from_camera'),
                  onTap: () => print('place holder')
                ),
                SelectButton(
                  assetPath: 'lib/assets/library_icon.png',
                  displayText: AppLocalizations.instance.text('from_library'),
                  // onTap: () => viewModel.selectLibrary(ImageSource.gallery)
                  onTap: () => print('place holder')
                ),
              ],
            )
          ],
        )
      )
    );
  }

}