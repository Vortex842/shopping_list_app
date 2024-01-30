import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final productController = ref.watch(productControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [productController, amountController, priceController];
});
