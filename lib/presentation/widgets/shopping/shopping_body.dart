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
      decoration: BoxDecoration(
        color: ref.bodyColor(isDark),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 3,
            color: Colors.black.withOpacity(0.15),
          ),
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
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
