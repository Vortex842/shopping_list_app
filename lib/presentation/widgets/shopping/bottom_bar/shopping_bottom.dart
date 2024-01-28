import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/dark_mode_provider.dart';
import '../../../providers/product_list_provider.dart';
import '../../../references/references.barrel.dart';
import 'bottombar_buttons/bottom_bar_buttons.dart';

class ShoppingBottom extends ConsumerWidget {
  final double maxHeight;

  const ShoppingBottom({required this.maxHeight, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final isAnyChecked = ref.watch(isAnyCheckedProvider);

    return Container(
      width: double.infinity,
      height: maxHeight,
      decoration: ref.bottomDecoration(isDark),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Align(
          alignment: Alignment.center,
          child: BottomBarButtons(),
        ),
      ),
    );
  }
}
