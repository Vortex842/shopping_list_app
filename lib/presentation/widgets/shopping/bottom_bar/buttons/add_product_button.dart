import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

import '../../../../providers/providers.barrel.dart';

class AddProductButton extends ConsumerWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return FloatingActionButton(
      backgroundColor: ref.buttonColorBottomBar(isDark),
      onPressed: () {
        // ADD PRODUCT BUTTON
        ref.read(onAddEditProvider.notifier).update((state) => true);
      },
      child: const Icon(
        LucideIcons.shoppingCart,
        size: 25,
      ),
    );
  }
}
