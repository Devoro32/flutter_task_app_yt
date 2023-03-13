//https://youtu.be/PD0eAXLd5ls?t=2960

import 'package:flutter/material.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TasksScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
    }
  }
}
