import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class IconShopCart extends ConsumerWidget {
  const IconShopCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsOnCart = ref.watch(productsCartProvider);

    return IconButton(
      onPressed: productsOnCart.isEmpty
          ? null
          : () {
              ref.onCartButtonPress();
            },
      icon: Icon(
        LucideIcons.shoppingCart,
        size: 25,
        color: productsOnCart.isEmpty
            ? ref.foregroundDisableColor()
            : ref.foregroundColor(),
      ),
    );
  }
}
