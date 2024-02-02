import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'editable_product_provider.dart';

final productControllerProvider = StateProvider<TextEditingController>((ref) {
  final product = ref.watch(editableProductProvider);
  return TextEditingController(text: product?.name ?? '');
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  final product = ref.watch(editableProductProvider);
  return TextEditingController(text: product?.amount.toString() ?? '');
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  final product = ref.watch(editableProductProvider);
  return TextEditingController(text: product?.price.toStringAsFixed(2) ?? '');
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final productController = ref.watch(productControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [productController, amountController, priceController];
});
