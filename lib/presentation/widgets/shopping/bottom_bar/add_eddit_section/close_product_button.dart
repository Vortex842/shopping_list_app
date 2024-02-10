import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '/presentation/references/color_reference.dart';
import '/presentation/references/utils/utils_donde_cancel.dart';

class CloseProductButton extends ConsumerWidget {
  const CloseProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        log("Close");

        ref.closeAddEditSection();
      },
      icon: Icon(
        LucideIcons.x,
        size: 30,
        color: ref.foregroundColor(),
      ),
    );
  }
}
