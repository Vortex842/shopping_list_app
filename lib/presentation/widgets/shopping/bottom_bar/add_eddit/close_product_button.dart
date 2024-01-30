import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/utils_reference.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/color_reference.dart';

class CloseProductButton extends ConsumerWidget {
  const CloseProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return IconButton(
      onPressed: () {
        log("Done");

        ref.closeAddEditSection(ref);
      },
      icon: Icon(
        LucideIcons.x,
        size: 30,
        color: ref.foregroundColor(isDark),
      ),
    );
  }
}
