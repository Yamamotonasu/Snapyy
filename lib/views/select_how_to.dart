import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/view_models/select_how_to_view_model.dart';
import 'package:snappy/widgets/select_button.dart';

class SelectHowTo extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(selectHowToViewModelProvider.notifier);
    // final provider = useProvider(selectHowToViewModelProvider);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.instance.text('where_select_photo'),
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              Center(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SelectButton(
                        assetPath: 'lib/assets/camera_icon.png',
                        displayText: AppLocalizations.instance.text('from_camera'),
                        onTap: () => viewModel.selectLibrary(ImageSource.camera)
                      ),
                      SelectButton(
                        assetPath: 'lib/assets/library_icon.png',
                        displayText: AppLocalizations.instance.text('from_library'),
                        // onTap: () => viewModel.selectLibrary(ImageSource.gallery)
                        onTap: () => Navigator.of(context).pushNamed('/results'),
                      ),
                    ],
                  )
                )
              )
            ],
          )
        )
      )
    );
  }

}