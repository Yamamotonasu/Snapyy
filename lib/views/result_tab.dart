import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:snappy/utils/localization.dart';
import 'package:snappy/views/full_text_page.dart';
import 'package:snappy/views/one_line_page.dart';

class TabInfo {
  final String label;
  final Widget container;
  
  TabInfo({required this.label, required this.container});
}

class ResultTab extends HookWidget {

  static const routeName = '/results';

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
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(AppLocalizations.instance.text('title'), style: Theme.of(context).textTheme.headline1),
          iconTheme: IconThemeData(color: Colors.white),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              enableFeedback: true,
              indicatorColor: Colors.white,
              indicatorWeight: 2.0,
              labelPadding: EdgeInsets.symmetric(horizontal: 70.0),
              labelStyle: Theme.of(context).textTheme.headline4,
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