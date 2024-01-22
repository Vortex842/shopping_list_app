import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.barrel.dart';
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
    final dismissDirection = ref.watch(dismissDirectionProvider);

    return Container(
      height: 60,
      decoration: ref.buttonDecoration(
        isDark,
        dismissDirection: dismissDirection,
      ),
      child: ClipRRect(
        borderRadius: ref.buttonRadius,
        child: Dismissible(
          key: Key(hashCode.toString()),
          // onDismissed: (direction) {
          //   print("Dismiss");
          // },

          // onUpdate: (details) => details.reached
          //     ? null
          //     : {
          //         if (details.direction != dismissDirection)
          //           ref.read(dismissDirectionProvider.notifier).update(
          //             (state) {
          //               return details.direction;
          //             },
          //           ),
          //       },
          child: ButtonSection(
            name: name,
            price: price,
            amount: amount,
          ),
        ),
      ),
    );
  }
}

class ButtonSection extends ConsumerWidget {
  const ButtonSection({
    super.key,
    required this.name,
    required this.price,
    required this.amount,
  });

  final String name;
  final double price;
  final int amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return DecoratedBox(
      decoration: ref.buttonSectionDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.buttonRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
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
    );
  }
}
