import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/authentication/data/fake_auth_repository.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController({required this.fakeAuthRepository})
      : super(const AsyncData(null));
  final FakeAuthRepository fakeAuthRepository;

  Future<void> login() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(fakeAuthRepository.login);
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(fakeAuthRepository.logout);
  }
}

final authControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<void>>((ref) {
  return LoginController(
      fakeAuthRepository: ref.watch(fakeAuthRepositoryProvider));
});
