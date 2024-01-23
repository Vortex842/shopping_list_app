import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/data/domain/entities/product.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';

import '../../../providers/providers.barrel.dart';
import '../../../themes/themes.barrel.dart';
import 'button_section.dart';

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
        ref.read(productsProvider.notifier).toggleCheck(
              product.id,
            );
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
