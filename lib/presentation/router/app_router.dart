import 'package:counter_cubit/presentation/router/routing_constants.dart';
import 'package:counter_cubit/presentation/screen/home_screen.dart';
import 'package:counter_cubit/presentation/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    print("switching to screen route ${settings.name}");
    final args = settings.arguments;
    switch (settings.name) {
      case HomeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  title: "Home Page",
                ));
      case SecondScreenRoute:
        return MaterialPageRoute(
            builder: (_) => SecondPage(
                  title: "Second Page",
                  homeScreenKey: args as GlobalKey<ScaffoldState>,
                ));
      default:
        return null;
    }
  }
}
