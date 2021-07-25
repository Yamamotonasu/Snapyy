import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snappy/view_models/select_how_to_view_model.dart';
import 'package:snappy/widgets/empty_text_view.dart';
import 'package:snappy/widgets/one_line_text_cell.dart';

final List<String> data = [
  "これはダミー用のデータ1です",
  "これはダミー用のデータ2です",
  "これはダミー用のデータ3です",
  "これはダミー用のデータ4です",
  "これはダミー用のデータ5です",
  "これはダミー用のデータ6です",
  "これはダミー用のデータ7です",
  "これはダミー用のデータ8です",
  "これはダミー用のデータ9です",
  "これはダミー用のデータ10です",
  "これはダミー用のデータ11です",
  "これはダミー用のデータ12です",
  "これはダミー用のデータ13です",
  "これはダミー用のデータ14です",
];

final List<Widget> cell = data.map((e) => OneLineTextCell(displayText: e)).toList();

class OneLinePage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final state = useProvider(selectHowToViewModelProvider); 
    final List<Widget> cell = state.detectedTexts.map((e) => OneLineTextCell(displayText: e)).toList();
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: !state.hasEnglishText ? EmptyTextView() : ListView(
          children: cell,
        )
      )
    );
  }

}