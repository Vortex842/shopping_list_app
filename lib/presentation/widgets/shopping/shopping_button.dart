import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/data/domain/entities/product.dart';

import '../../providers/providers.barrel.dart';
import '../../themes/themes.barrel.dart';

class ShoppingButton extends ConsumerWidget {
  final Product product;
  final int indexOf;

  const ShoppingButton({
    super.key,
    required this.product,
    required this.indexOf,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final dismissDirection = ref.watch(dismissDirectionProvider);
    final isDismiss = ref.watch(isDismissProvider);

    return Container(
      height: 60,
      decoration: ref.buttonDecoration(
        isDark,
        dismissDirection: dismissDirection,
      ),
      child: ClipRRect(
        borderRadius: ref.buttonRadius,
        child: Stack(
          children: [
            ButtonEditDelete(key: UniqueKey(), indexOf),
            Dismissible(
              key: Key(product.hashCode.toString()),
              confirmDismiss: (direction) async {
                if (isDismiss) {
                  ref.read(productsProvider.notifier).update(
                        (products) => [
                          ...products..removeAt(indexOf),
                        ],
                      );
                  ref.read(dismissDirectionProvider.notifier).update(
                    (state) {
                      return DismissDirection.none;
                    },
                  );
                  print("Delete: ${product.toString()}");
                  return true;
                } else {
                  print("Edit: ${product.toString()}");
                  return false;
                }
              },
              onUpdate: (details) =>
                  ref.read(dismissDirectionProvider.notifier).update(
                        (directions) => details.direction,
                      ),
              child: ButtonSection(key: UniqueKey(), product),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonEditDelete extends ConsumerWidget {
  final int indexOf;

  const ButtonEditDelete(
    this.indexOf, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDismiss = ref.watch(isDismissProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: isDismiss ? Alignment.centerRight : Alignment.centerLeft,
        child: Icon(
          isDismiss ? LucideIcons.delete : LucideIcons.edit,
          color: isDismiss ? ref.deleteColor(false) : ref.editColor(false),
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
