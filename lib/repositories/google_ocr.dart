import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class GoogleOCR {

  final TextDetector _textDetector = GoogleMlKit.vision.textDetector();

  Future<List<TextBlock>> detectTextFromImage({required PickedFile file}) async {
    final path = file.path;
    final image = InputImage.fromFile(File(path));
    final results = await _textDetector.processImage(image);
    await _textDetector.close();
    return results.blocks;
  }

}