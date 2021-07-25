import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/repositories/translate.dart';

final translateViewModelNotifier = StateNotifierProvider<TranslateViewModel, String>((_) => TranslateViewModel('Now Loading...'));

class TranslateViewModel extends StateNotifier<String> {

  final respository = Translate();

  TranslateViewModel(String state) : super(state);

  Future<void> execTranslate(String text) async {
    final response = await respository.translate(text);
    state = response.translatedText;
  }

}