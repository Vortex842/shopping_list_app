import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/providers/dark_mode_provider.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class AddProductButton extends ConsumerWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return FloatingActionButton(
      backgroundColor: ref.buttonColorBottomBar(isDark),
      onPressed: () {
        // ADD PRODUCT BUTTON
      },
      child: const Icon(
        LucideIcons.shoppingCart,
        size: 25,
      ),
    );
  }
}
