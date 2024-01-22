import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/domain/entities/product.dart';

import '../../providers/providers.barrel.dart';
import '../../themes/themes.barrel.dart';

class ShoppingButton extends ConsumerWidget {
  final Product product;

  const ShoppingButton({
    super.key,
    required this.product,
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

          onUpdate: (details) =>
              ref.read(dismissDirectionProvider.notifier).update(
            (state) {
              if (details.progress == 0) return DismissDirection.none;

              return details.direction;
            },
          ),

          child: ButtonSection(product),
        ),
      ),
    );
  }
}

class ButtonSection extends ConsumerWidget {
  final Product product;

  const ButtonSection(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return DecoratedBox(
      decoration: ref.buttonSectionDecoration(isDark),
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
                    product.name,
                    style: ref.productText(isDark),
                  ),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: ref.priceText(isDark),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${product.amount}",
                  style: ref.amountText(isDark),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
