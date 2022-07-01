import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_dimy_tech/src/features/home/data/home_repository.dart';

class HotCoffeeController extends StateNotifier<AsyncValue<void>> {
  HotCoffeeController({
    required this.hotCoffeeRepository,
  }) : super(const AsyncData<void>(null));
  final HotCoffeeRepository hotCoffeeRepository;

  void init() {
    if (hotCoffeeRepository.currentState == null) {
      fetchHotCoffee();
    }
  }

  Future<void> fetchHotCoffee() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(hotCoffeeRepository.fetchHotCoffee);
  }
}

final hotCoffeeControllerProvider =
    StateNotifierProvider.autoDispose<HotCoffeeController, AsyncValue<void>>(
        (ref) {
  return HotCoffeeController(
      hotCoffeeRepository: ref.watch(hotCoffeeRepositoryProvider))
    ..init();
});
