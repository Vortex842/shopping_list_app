import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class SearchProductButton extends ConsumerWidget {
  const SearchProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: ref.buttonColorBottomBar(),
      onPressed: () {
        // ADD PRODUCT BUTTON
      },
      child: const Icon(
        LucideIcons.search,
        size: 20,
      ),
    );
  }
}
