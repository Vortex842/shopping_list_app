import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/new_product_provider.dart';

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  final editableProduct = ref.watch(editableProductProvider);
  return TextEditingController(text: editableProduct?.name ?? '');
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  final editableProduct = ref.watch(editableProductProvider);
  return TextEditingController(text: editableProduct?.amount.toString() ?? '');
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  final editableProduct = ref.watch(editableProductProvider);
  return TextEditingController(text: editableProduct?.price.toString() ?? '');
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [nameController, amountController, priceController];
});
