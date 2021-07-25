import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappy/states/select_how_to_state.dart';

final selectHowToViewModelProvider = StateNotifierProvider<SelectHowToViewModel, SelectHowToState>((_) => SelectHowToViewModel(SelectHowToState(isLoading: false, detectedTexts: [], hasEnglishText: false)));

class SelectHowToViewModel extends StateNotifier<SelectHowToState>{

  final _imagePicker = ImagePicker();

  SelectHowToViewModel(SelectHowToState state) : super(state);

  Future<bool> selectLibrary(ImageSource imageSource) async {
    final pickerFile = await _imagePicker.pickImage(source: imageSource);
    if (pickerFile != null) {
      final path = pickerFile.path;
      state.selectedImagePath = path;
      state.isLoading = true;
      final google = GoogleMlKit.vision.textDetector();
      final image = InputImage.fromFile(File(path));
      final results = await google.processImage(image);
      state.detectedTexts = results.blocks.map((e) => e.text).toList();
      final mappedLanguage = results.blocks.map((e) => e.recognizedLanguages).toList().expand((element) => element).toList();
      state.hasEnglishText = mappedLanguage.contains('en');
      state.isLoading = false;
      return true;
    } else {
      return false;
    }
  }

}