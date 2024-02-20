import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '/presentation/references/references.barrel.dart';
import '../../../../providers/on_change_states/on_add_cart_provider.dart';

class DoneProductButton extends ConsumerWidget {
  const DoneProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final onAddCart = ref.read(onAddCartProvider);

        ref.toDoneProduct();

        if (onAddCart) {
          ref.onCartButtonPress();
        }

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
