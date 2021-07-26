
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappy/repositories/google_ocr.dart';
import 'package:snappy/states/select_how_to_state.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/views/result_tab.dart';

final selectHowToViewModelProvider = StateNotifierProvider<SelectHowToViewModel, SelectHowToState>((_) => SelectHowToViewModel(SelectHowToState(detectedTexts: [], hasEnglishText: false)));

class SelectHowToViewModel extends StateNotifier<SelectHowToState>{

  final _imagePicker = ImagePicker();

  final ocrRepository = GoogleOCR();

  SelectHowToViewModel(SelectHowToState state) : super(state);

  Future<void> selectLibrary(ImageSource imageSource, BuildContext context) async {
    try {
      final pickerFile = await _imagePicker.getImage(source: imageSource);
      if (pickerFile != null) {
        final text = await ocrRepository.detectTextFromImage(file: pickerFile);
        state.detectedTexts = text.where((e) => e.recognizedLanguages.first == 'en').toList().map((e) => e.text).toList();
        state.hasEnglishText = state.detectedTexts.isNotEmpty;
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