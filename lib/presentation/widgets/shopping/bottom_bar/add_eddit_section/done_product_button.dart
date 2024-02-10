import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '/presentation/references/color_reference.dart';
import '/presentation/references/utils/utils_donde_cancel.dart';

class DoneProductButton extends ConsumerWidget {
  const DoneProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.toDoneProduct();

        log("Done");
      },
      icon: Icon(
        LucideIcons.chevronRight,
        size: 35,
        color: ref.foregroundColor(),
      ),
    );
  }
}
