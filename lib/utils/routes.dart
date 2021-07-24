import 'package:flutter/material.dart';
import 'package:snappy/views/result_tab.dart';

enum Routes {
  resultTab,
}

extension RoutesExtension on Routes {

  String get routeName {
    switch (this) {
      case Routes.resultTab:
        return '/results';
    }
  }

}


final Map<String, Widget Function(BuildContext)> routes = {
  // Redult tab screen.
  Routes.resultTab.routeName: (context) => ResultTab(),
};