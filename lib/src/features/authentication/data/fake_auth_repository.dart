import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/authentication/domain/auth_model.dart';
import 'package:test_dimy_tech/src/utils/in_memory_storage.dart';

class FakeAuthRepository {
  final _authState = InMemoryStorage<AuthModel?>(null);

  Stream<AuthModel?> authStateChanges() => _authState.stream;
  AuthModel? get currentUser => _authState.value;

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 1));
    _authState.value = AuthModel(
      name: "Anonymous",
      pin: "2022",
    );
  }

  Future<void> logout() async {
    _authState.value = null;
  }

  void dispose() => _authState.dispose();
}

final fakeAuthRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final fakeAuthStateChangesProvider =
    StreamProvider.autoDispose<AuthModel?>((ref) {
  return ref.watch(fakeAuthRepositoryProvider).authStateChanges();
});
