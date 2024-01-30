import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/providers/dark_mode_provider.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class SearchProductButton extends ConsumerWidget {
  const SearchProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return FloatingActionButton(
      mini: true,
      backgroundColor: ref.buttonColorBottomBar(isDark),
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
