class TranslateEntity {
  final String translatedText;
  final int code;
  TranslateEntity({required this.translatedText, required this.code});

  static TranslateEntity fromJson(Map<String, dynamic> json) {
    return TranslateEntity(translatedText: json['text'] as String, code: json['code'] as int);
  }
}