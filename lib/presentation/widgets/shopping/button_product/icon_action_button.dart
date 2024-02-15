// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class IconActionButton extends ConsumerWidget {
  final ButtonActionType btnAction;

  const IconActionButton({
    this.btnAction = ButtonActionType.none,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    IconData? icon;
    Color? color;

    switch (btnAction) {
      case ButtonActionType.none:
        icon = null;
        color = null;
        break;
      case ButtonActionType.edit:
        icon = LucideIcons.edit;
        color = ref.editIconColor(true);
        break;
      case ButtonActionType.delete:
        icon = LucideIcons.delete;
        color = ref.deleteIconColor(true);
        break;
      case ButtonActionType.select:
        icon = onAddCart ? Icons.remove_shopping_cart : LucideIcons.check;
        color = onAddCart
            ? ref.leaveCartIconColor(true)
            : ref.selectIconColor(true);
        break;
    }

    return Icon(icon, color: color);
  }
}
