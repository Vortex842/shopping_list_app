import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/new_product_provider.dart';

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  final newProduct = ref.watch(newProductProvider);
  return TextEditingController(text: newProduct?.name ?? '');
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  final newProduct = ref.watch(newProductProvider);
  return TextEditingController(text: newProduct?.amount.toString() ?? '');
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  final newProduct = ref.watch(newProductProvider);
  return TextEditingController(text: newProduct?.price.toString() ?? '');
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [nameController, amountController, priceController];
});
