import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/authentication/presentation/login_controller.dart';
import 'package:test_dimy_tech/src/features/home/data/home_repository.dart';
import 'package:test_dimy_tech/src/features/home/presentation/home_body.dart';
import 'package:test_dimy_tech/src/features/home/presentation/home_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerProvider);
    final homeController = ref.watch(hotCoffeeControllerProvider);
    final homeState = ref.watch(hotCoffeeStateChangesProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          authController.maybeWhen(
            loading: () => const CircularProgressIndicator(),
            orElse: () => IconButton(
              key: const Key("buttonLogout"),
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).logout(),
              icon: const Icon(Icons.logout_rounded),
            ),
          ),
        ],
      ),
      body: homeController.maybeWhen(orElse: () {
        return homeState.maybeWhen(
          data: (hotCoffee) {
            if (hotCoffee != null) {
              return HomeBody(data: hotCoffee);
            }
            return const HomeShimmer();
          },
          orElse: () => const HomeShimmer(),
        );
      }, error: (error, _) {
        return Center(
          child: Text(error.toString()),
        );
      }),
    );
  }
}
