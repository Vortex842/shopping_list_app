import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dark_mode_provider.dart';
import '../../themes/themes.barrel.dart';

class ShoppingBottom extends ConsumerWidget {
  final double maxHeight;

  const ShoppingBottom({required this.maxHeight, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return Container(
      height: 60,
      decoration: ref.bottomDecoration(isDark),
    );
  }
}
