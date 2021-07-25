import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/repositories/translate.dart';

final translateViewModelNotifier = StateNotifierProvider<TranslateViewModel, String>((_) => TranslateViewModel(''));

class TranslateViewModel extends StateNotifier<String> {

  final _respository = Translate();

  TranslateViewModel(String state) : super(state);

  Future<void> execTranslate(String text) async {
    final response = await _respository.translate(text);
    state = response.translatedText;
  }

}