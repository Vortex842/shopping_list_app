import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class FilterProductButton extends ConsumerWidget {
  const FilterProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: ref.buttonColorBottomBar(),
      onPressed: () {
        // ADD PRODUCT BUTTON

        print("Filter button");
      },
      child: const Icon(
        LucideIcons.arrowDownAZ,
        size: 20,
      ),
    );
  }
}
