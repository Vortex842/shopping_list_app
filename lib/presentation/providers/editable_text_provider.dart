import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: '');
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [nameController, amountController, priceController];
});

final isEmptyFieldsProvider = StateProvider<bool>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);

  return nameController.text.isNotEmpty && amountController.text.isNotEmpty;
});
