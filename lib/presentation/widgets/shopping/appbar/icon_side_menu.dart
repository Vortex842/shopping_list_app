import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';

class IconSideMenu extends ConsumerWidget {
  const IconSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return IconButton(
      onPressed: () {
        final onAddEdit = ref.read(onAddEditProvider);
        final onMultiSelect = ref.read(multiSelectVisibleProvider);

        if (onAddEdit) {
          ref.closeAddEditSection();
        }

        if (onMultiSelect) {
          ref.unselectList();
        }

        ref.read(onSideMenuActiveProvider.notifier).update(
              (state) => !state,
            );
      },
      icon: Icon(
        isDark ? LucideIcons.alignRight : LucideIcons.alignLeft,
        size: 25,
        color: ref.foregroundColor(),
      ),
    );
  }
}
