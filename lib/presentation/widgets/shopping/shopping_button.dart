import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dark_mode_provider.dart';
import '../../themes/themes.barrel.dart';

class ShoppingButton extends ConsumerWidget {
  final String name;
  final double price;
  final int amount;

  const ShoppingButton({
    super.key,
    required this.name,
    required this.price,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return Container(
      height: 60,
      decoration: ref.buttonDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.buttonRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Dismissible(
            key: Key(hashCode.toString()),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: ref.productText(isDark),
                      ),
                      Text(
                        "\$${price.toStringAsFixed(2)}",
                        style: ref.priceText(isDark),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$amount",
                      style: ref.amountText(isDark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
