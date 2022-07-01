import 'package:flutter/material.dart';
import 'package:test_dimy_tech/src/features/authentication/presentation/auth_screen.dart';
import 'package:test_dimy_tech/src/res/themes.dart';
import 'package:test_dimy_tech/src/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Dimy Tech',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      theme: themeData,
      home: const AuthScreen(),
    );
  }
}
