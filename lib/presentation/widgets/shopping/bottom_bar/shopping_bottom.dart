import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/dark_mode_provider.dart';
import '../../../references/references.barrel.dart';
import 'buttons/buttons_bottombar.barrel.dart';

class ShoppingBottom extends ConsumerWidget {
  final double maxHeight;

  const ShoppingBottom({required this.maxHeight, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return Container(
      height: maxHeight,
      decoration: ref.bottomDecoration(isDark),
      child: const Center(
        child: BottomBarButtons(),
      ),
    );
  }
}

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AddProductButton(),
        SearchProductButton(),
      ],
    );
  }
}
