import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameControllerProvider = StateProvider<String>((ref) => '');

final amountControllerProvider = StateProvider<String>((ref) => '');

final priceControllerProvider = StateProvider<String>((ref) => '');

final controllerProviders = StateProvider<List<StateProvider<String>>>((ref) {
  return [
    nameControllerProvider,
    amountControllerProvider,
    priceControllerProvider
  ];
});
