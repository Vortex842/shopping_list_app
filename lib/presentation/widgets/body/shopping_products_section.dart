import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import '../button_product/shopping_button.dart';

class ShoppingProductsSection extends ConsumerWidget {
  const ShoppingProductsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(selectProductsProvider);

    final scrollController = ref.watch(scrollControllerProvider);

    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          direction: Axis.horizontal,
          runSpacing: 10,
          children: List.generate(
            products.length,
            (index) => ShoppingButton(
              key: Key(products[index].hashCode.toString()),
              product: products[index],
            ),
          ),
        ),
      ),
    );
  }
}
