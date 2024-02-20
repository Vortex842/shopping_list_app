import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/visibility/add_cart_button_visible_provider.dart';
import '/presentation/references/references.barrel.dart';

class IconShopCart extends ConsumerWidget {
  const IconShopCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCartButtonVisible = ref.watch(addCartButtonVisibleProvider);

    return IconButton(
      onPressed: addCartButtonVisible
          ? () {
              ref.onCartButtonPress();
            }
          : null,
      icon: Icon(
        LucideIcons.shoppingCart,
        size: 25,
        color: addCartButtonVisible
            ? ref.foregroundColor()
            : ref.foregroundDisableColor(),
      ),
    );
  }
}
