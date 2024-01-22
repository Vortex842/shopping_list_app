import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dark_mode_provider.dart';
import '../../themes/themes.barrel.dart';
import 'shopping_button.dart';

class ShoppingBody extends ConsumerWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

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
                20,
                (index) => ShoppingButton(
                  name: "Product ${index + 1}",
                  price: index * 3.333999,
                  amount: index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
