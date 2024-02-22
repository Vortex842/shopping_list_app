import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/providers/visibility/side_menu_shown.dart';
import '/presentation/references/references.barrel.dart';

class IconSideMenu extends ConsumerWidget {
  const IconSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSideMenuShown = ref.watch(sideMenuShownProvider);

    return IconButton(
      onPressed: () {
        final onAddEdit = ref.read(onAddEditProvider);
        final onMultiSelect = ref.read(multiSelectVisibleProvider);
        final onConfirm = ref.watch(onConfirmCancelProvider);

        if (onAddEdit) {
          ref.closeAddEditSection();
        }

        if (onMultiSelect) {
          ref.unselectList();
        }

        if (onConfirm) {
          ref.whenConfirmCancel();
        }

        ref.read(onSideMenuActiveProvider.notifier).update(
              (state) => !state,
            );
      },
      icon: Icon(
        onSideMenuShown ? LucideIcons.alignRight : LucideIcons.alignLeft,
        size: 25,
        color: ref.foregroundColor(),
      ),
    );
  }
}
