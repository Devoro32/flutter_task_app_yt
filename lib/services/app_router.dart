//https://youtu.be/PD0eAXLd5ls?t=2960

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
    }
  }
}
