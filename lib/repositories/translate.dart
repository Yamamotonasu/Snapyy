import 'package:dio/dio.dart';
import 'package:snappy/entities/translate_entity.dart';
import 'package:snappy/utils/localization.dart';

class Translate {

  Future<TranslateEntity> translate(String englishText) async {
    try {
      final response = await Dio().get<dynamic>('https://script.google.com/macros/s/AKfycbyNTrn6C_w8pRpN__iZzKLIv8Ncuarlzw7XsZSnq2tpQRuwQJTzbSvnPYLnpC5R5lw1/exec?text=$englishText');
      final entity = TranslateEntity.fromJson(response.data as Map<String, dynamic>);
      return entity;
    } catch(e) {
      print(e);
      return TranslateEntity(translatedText: AppLocalizations.instance.text('failed_translate'), code: 400);
    }
  }

}