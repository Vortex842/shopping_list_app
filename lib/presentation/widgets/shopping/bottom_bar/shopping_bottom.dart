import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'bottombar_buttons/bottom_bar_buttons.dart';

class ShoppingBottom extends ConsumerWidget {
  const ShoppingBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final isAnyChecked = ref.watch(isAnyCheckedProvider);
    final onAddEdit = ref.watch(onAddEditProvider);

    return Container(
      width: double.infinity,
      height: ref.bottomHeight(onAddEdit),
      decoration: ref.bottomDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Align(
            // TODO: Create Actions: 'selected' and 'Accept or Cancel'
            alignment: !isAnyChecked ? Alignment.center : Alignment.centerLeft,
            child: !isAnyChecked
                ? const BottomBarButtons()
                : Container(
                    width: 100,
                    color: Colors.red,
                  ),
          ),
        ),
      ),
    );
  }
}
