import 'package:flutter/material.dart';
import 'package:todoapp/core/Router/routes.dart';
import 'package:todoapp/feature/home/ui/home_screen.dart';
import 'package:todoapp/feature/todo/ui/task_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.taskScreen:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
