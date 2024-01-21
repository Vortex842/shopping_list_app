import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../palette/color_theme.dart';
import '../../palette/text_theme.dart';
import '../../providers/dark_mode_provider.dart';

class ShoppingAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ShoppingAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return LayoutBuilder(
      builder: (_, bordes) => SizedBox.fromSize(
        size: Size.fromHeight(bordes.maxHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    ref.read(isDarkMode.notifier).update(
                          (state) => !state,
                        );
                  },
                  icon: Icon(
                    LucideIcons.alignLeft,
                    size: 25,
                    color: ref.foregroundColor(isDark),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Shopping List",
                  style: ref.titleText(isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
