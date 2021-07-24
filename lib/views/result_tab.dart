import 'package:flutter/material.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/views/full_text.dart';
import 'package:snappy/views/one_line_page.dart';

class TabInfo {
  final String label;
  final Widget container;
  
  TabInfo({required this.label, required this.container});
}

class ResultTab extends StatelessWidget {

  final List<TabInfo> _tabs = [
    TabInfo(label: AppLocalizations.instance.text('one_line_text'), container: OneLinePage()),
    TabInfo(label: AppLocalizations.instance.text('full_text'), container: FullTextPage())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.instance.text('title'), style: Theme.of(context).textTheme.headline1),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              enableFeedback: true,
              labelStyle: Theme.of(context).textTheme.headline4,
              labelPadding: EdgeInsets.symmetric(horizontal: 70.0),
              tabs: _tabs.map((tab) {
                return Tab(text: tab.label);
              }).toList(),
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        body: TabBarView(children: <Widget>[
          ..._tabs.map((tab) => tab.container).toList()
        ],
      )
    )
    );
  }
  
}