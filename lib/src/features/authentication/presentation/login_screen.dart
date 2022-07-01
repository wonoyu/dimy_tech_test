import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/authentication/presentation/login_controller.dart';
import 'package:test_dimy_tech/src/res/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _pin = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: "formPin");

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: kDimyCoffee95,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const Key("PIN"),
                  enabled: authController.maybeWhen(
                      loading: () => false, orElse: () => true),
                  validator: (pin) {
                    if (pin!.isNotEmpty && pin != "2022") {
                      return "PIN Anda Salah!";
                    }
                    if (pin.isEmpty) {
                      return "PIN Tidak Boleh Kosong!";
                    }
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _pin,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter PIN"),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                authController.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  orElse: () => ElevatedButton(
                      key: const Key("buttonLogin"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("OK");
                          ref.read(authControllerProvider.notifier).login();
                        }
                      },
                      child: const Text("Login")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
