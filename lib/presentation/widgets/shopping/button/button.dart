import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/themes/color_theme.dart';

class ButtonEditDelete extends ConsumerWidget {
  final int indexOf;

  const ButtonEditDelete(
    this.indexOf, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const isDismiss = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: isDismiss ? Alignment.centerRight : Alignment.centerLeft,
        child: Icon(
          isDismiss ? LucideIcons.delete : LucideIcons.edit,
          color: isDismiss ? ref.deleteColor(false) : ref.editColor(false),
        ),
      ),
    );
  }
}
