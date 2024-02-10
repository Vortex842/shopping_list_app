import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../providers/providers.barrel.dart';

class AddProductButton extends ConsumerWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        // ADD PRODUCT BUTTON
        ref.read(onAddEditProvider.notifier).update((state) => true);
        ref
            .read(controllerProviders)
            .forEach((controller) => controller.clear());
      },
      child: const Icon(
        LucideIcons.shoppingCart,
        size: 25,
      ),
    );
  }
}
