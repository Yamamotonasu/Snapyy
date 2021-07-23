import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappy/states/select_how_to_state.dart';

final selectHowToViewModelProvider = StateNotifierProvider<SelectHowToViewModel, SelectHowToState>((_) => SelectHowToViewModel(SelectHowToState(isLoading: 1) ));

class SelectHowToViewModel extends StateNotifier<SelectHowToState>{

  final _imagePicker = ImagePicker();

  SelectHowToViewModel(SelectHowToState state) : super(state);

  void setIsLoading() {
    state.isLoading++;
  }

  Future<void> selectLibrary(ImageSource imageSource) async {
    final pickerFile = await _imagePicker.pickImage(source: imageSource);
    if (pickerFile != null) {
      final path = pickerFile.path;
      state.selectedImagePath = path;
    }
  }

}