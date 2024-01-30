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
    // print("build - button section - ${product.toString()}");
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
                    style: ref.productText(),
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

class TransformButton extends StatelessWidget {
  final ButtonSection child;

  const TransformButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(0.95, 0.8),
        child: child,
      ),
    );
  }
}

class DismissibleButton extends ConsumerWidget {
  final Product product;
  final ValueNotifier<DismissDirection> dismissDirection;
  final ButtonSection child;

  const DismissibleButton({
    super.key,
    required this.product,
    required this.dismissDirection,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnyChecked = ref.watch(isAnyCheckedProvider);
    final onAddEdit = ref.watch(onAddEditProvider);

    return Dismissible(
      key: Key(product.hashCode.toString()),
      direction: isAnyChecked || onAddEdit
          ? DismissDirection.none
          : DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          print("Delete - ${product.toString()}");
          ref.read(productsProvider.notifier).deleteProduct(
                product.id,
              );
          return true;
        }
        print("Edit - ${product.toString()}");

        return false;
      },
      onUpdate: (details) {
        if (details.direction != dismissDirection.value) {
          dismissDirection.value = details.direction;
        }
        if (details.progress == 0) {
          dismissDirection.value = DismissDirection.none;
        }
      },
      child: child,
    );
  }
}
