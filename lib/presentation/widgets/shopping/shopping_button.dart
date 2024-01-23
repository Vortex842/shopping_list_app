import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/data/domain/entities/product.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';

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

    return GestureDetector(
      onLongPress: () {
        print("Presionado largo");
        ref.read(productsProvider.notifier).toggleCheck(product.id);
      },
      child: Container(
        height: 60,
        decoration: ref.buttonBackgroundDecoration(
          isDark,
          actionType: !product.isChecked
              ? ButtonActionType.none
              : ButtonActionType.select,
        ),
        child: ClipRRect(
          borderRadius: ref.buttonRadius,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  // color: Colors.red,
                  child: Transform.scale(
                    scaleY: product.isChecked ? 0.8 : 1,
                    scaleX: product.isChecked ? 0.95 : 1,
                    child: ButtonSection(product),
                  ),
                ),
              ),
              Expanded(
                flex: product.isChecked ? 1 : 0,
                child: SizedBox(
                  // color: Colors.blue,
                  child: Icon(
                    LucideIcons.check,
                    size: product.isChecked ? 25 : 0,
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

// class ButtonEditDelete extends ConsumerWidget {
//   final int indexOf;

//   const ButtonEditDelete(
//     this.indexOf, {
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     const isDismiss = false;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Align(
//         alignment: isDismiss ? Alignment.centerRight : Alignment.centerLeft,
//         child: Icon(
//           isDismiss ? LucideIcons.delete : LucideIcons.edit,
//           color: isDismiss ? ref.deleteColor(false) : ref.editColor(false),
//         ),
//       ),
//     );
//   }
// }