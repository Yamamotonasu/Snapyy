import 'package:flutter/material.dart';
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

class OneLinePage extends StatelessWidget {

  // For test
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: isEmpty ? EmptyTextView() : ListView(
          children: cell,
        )
      )
    );
  }

}