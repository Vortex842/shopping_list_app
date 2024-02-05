import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';

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
    // print("build - button section - ${product.toString()}");
    final isDark = ref.watch(isDarkProvider);

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
                  TextScroll(
                    "${product.name}               ",
                    fadeBorderSide: FadeBorderSide.both,
                    fadedBorder: true,
                    fadedBorderWidth: 0.05,
                    style: ref.nameText(),
                  ),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: ref.priceText(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${product.amount}",
                  style: ref.amountText(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
