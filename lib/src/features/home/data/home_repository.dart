import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/home/domain/hot_coffee_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_dimy_tech/src/utils/app_constants.dart';
import 'package:test_dimy_tech/src/utils/in_memory_storage.dart';

class HotCoffeeRepository {
  final _state = InMemoryStorage<List<HotCoffee>?>(null);

  Stream<List<HotCoffee>?> stateChanges() => _state.stream;
  List<HotCoffee>? get currentState => _state.value;

  Future<void> fetchHotCoffee() async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: path,
    );
    final result = await http.get(uri);
    final parser = IsolateParser();
    _state.value = await parser.decodeIsolate(result.body);
  }

  void dispose() => _state.dispose();
}

final hotCoffeeRepositoryProvider = Provider<HotCoffeeRepository>((ref) {
  final hotCoffeeRepository = HotCoffeeRepository();
  ref.onDispose(() => hotCoffeeRepository.dispose());
  return hotCoffeeRepository;
});

final hotCoffeeStateChangesProvider =
    StreamProvider.autoDispose<List<HotCoffee>?>((ref) {
  return ref.watch(hotCoffeeRepositoryProvider).stateChanges();
});
