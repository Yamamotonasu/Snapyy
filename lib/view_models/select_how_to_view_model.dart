import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/states/select_how_to_state.dart';

final selectHowToViewModelProvider = StateNotifierProvider<SelectHowToViewModel, SelectHowToState>((_) => SelectHowToViewModel(SelectHowToState(isLoading: 1) ));

class SelectHowToViewModel extends StateNotifier<SelectHowToState>{

  SelectHowToViewModel(SelectHowToState state) : super(state);

  void setIsLoading() {
    state.isLoading++;
  }

}