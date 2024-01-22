import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.barrel.dart';
import '../../themes/themes.barrel.dart';
import 'shopping_button.dart';

class ShoppingBody extends ConsumerWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final products = ref.watch(productsProvider);

    return Container(
      decoration: ref.bodyDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              children: List.generate(
                products.length,
                (index) => ShoppingButton(
                  product: products[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
