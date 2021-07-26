import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappy/states/select_how_to_state.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/views/result_tab.dart';

final selectHowToViewModelProvider = StateNotifierProvider<SelectHowToViewModel, SelectHowToState>((_) => SelectHowToViewModel(SelectHowToState(isLoading: false, detectedTexts: [], hasEnglishText: false)));

class SelectHowToViewModel extends StateNotifier<SelectHowToState>{

  final _imagePicker = ImagePicker();

  SelectHowToViewModel(SelectHowToState state) : super(state);

  Future<void> selectLibrary(ImageSource imageSource, BuildContext context) async {
    final imagePicker = ImagePicker();
    try {
      final pickerFile = await _imagePicker.getImage(source: imageSource);
      if (pickerFile != null) {
        final path = pickerFile.path;
        state.selectedImagePath = path;
        state.isLoading = true;
        final google = GoogleMlKit.vision.textDetector();
        final image = InputImage.fromFile(File(path));
        final results = await google.processImage(image);
        state.detectedTexts = results.blocks.where((e) => e.recognizedLanguages.first == 'en').toList().map((e) => e.text).toList();
        state.hasEnglishText = state.detectedTexts.isNotEmpty;
        state.isLoading = false;
        await google.close();
        Navigator.of(context).pushNamed(ResultTab.routeName);
      }
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e", style: Theme.of(context).textTheme.headline4),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
          label: AppLocalizations.instance.text('confirm'),
          onPressed: () {},
          ),
        ),
      );
    }
  }

}