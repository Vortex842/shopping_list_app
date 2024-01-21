import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/dark_mode_provider.dart';

import '../../palette/color_theme.dart';
import 'shopping_button.dart';

class ShoppingBody extends ConsumerWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return Container(
      color: context.bodyColor(isDark),
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
              15,
              (index) => ShoppingButton(
                name: "Product ${index + 1}",
                price: index * 3.333999,
                amount: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
