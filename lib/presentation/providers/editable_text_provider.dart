import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  // final name = ref.watch(editableProductProviderID)?.name;
  return TextEditingController();
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  // final amount = ref.watch(editableProductProviderID)?.amount;
  return TextEditingController();
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  // final price = ref.watch(editableProductProviderID)?.price;
  return TextEditingController();
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [nameController, amountController, priceController];
});
