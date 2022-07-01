import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/authentication/data/fake_auth_repository.dart';
import 'package:test_dimy_tech/src/features/authentication/presentation/login_screen.dart';
import 'package:test_dimy_tech/src/features/home/presentation/home_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(fakeAuthStateChangesProvider);
    return authState.maybeWhen(
        data: (user) => user != null ? const HomeScreen() : const LoginScreen(),
        orElse: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
