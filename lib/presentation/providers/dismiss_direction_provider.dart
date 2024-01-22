import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/product_list_provider.dart';

final dismissDirectionProvider = StateProvider<DismissDirection>((ref) {
  final products = ref.watch(productsProvider);

  return DismissDirection.none;
});

final isDismissProvider = StateProvider<bool>((ref) {
  final direction = ref.watch(dismissDirectionProvider);

  return direction == DismissDirection.endToStart;
});
