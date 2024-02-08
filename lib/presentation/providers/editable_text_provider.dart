import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'editable_product_provider.dart';

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  final name = ref.watch(editableProductProvider)?.name;
  return TextEditingController(text: name ?? '');
});

final amountControllerProvider = StateProvider<TextEditingController>((ref) {
  final amount = ref.watch(editableProductProvider)?.amount;
  return TextEditingController(
      text: amount != null
          ? amount > 0
              ? amount.toString()
              : ''
          : '');
});

final priceControllerProvider = StateProvider<TextEditingController>((ref) {
  final price = ref.watch(editableProductProvider)?.price;
  return TextEditingController(
      text: price != null
          ? price > 0
              ? price.toString()
              : ''
          : '');
});

final controllerProviders = StateProvider<List<TextEditingController>>((ref) {
  final nameController = ref.watch(nameControllerProvider);
  final amountController = ref.watch(amountControllerProvider);
  final priceController = ref.watch(priceControllerProvider);

  return [nameController, amountController, priceController];
});
