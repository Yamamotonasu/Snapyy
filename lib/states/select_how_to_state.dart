class SelectHowToState {
  bool isLoading;
  List<String> detectedTexts;
  bool hasEnglishText;
  String? selectedImagePath;
  SelectHowToState({required this.isLoading, required this.detectedTexts, required this.hasEnglishText});
}