import 'package:flutter/material.dart';
import 'package:test_dimy_tech/src/features/authentication/presentation/login_screen.dart';
import 'package:test_dimy_tech/src/features/home/presentation/home_screen.dart';
import 'package:test_dimy_tech/src/res/components/empty_screen.dart';

const homeScreen = "/homeScreen";
const loginScreen = "/loginScreen";

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const EmptyScreen(), settings: settings);
    }
  }
}
