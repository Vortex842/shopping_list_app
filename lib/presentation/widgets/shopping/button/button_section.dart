import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/domain/entities/product.dart';
import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';

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
