import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/dark_mode_provider.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class ShoppingTextEditable extends ConsumerWidget {
  const ShoppingTextEditable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return SizedBox(
      width: ref.editableTextWidth,
      child: InputDecorator(
        decoration: InputDecoration(
          isCollapsed: true,
          fillColor: ref.editableTextColor(isDark),
          filled: true,
          border: const UnderlineInputBorder(),
        ),
        child: EditableText(
          controller: TextEditingController(),
          focusNode: FocusNode(),
          style: ref.normalText().copyWith(height: 2),
          cursorHeight: 22,
          cursorOffset: const Offset(0, 5),
          cursorColor: Colors.black87,
          backgroundCursorColor: Colors.transparent,
        ),
      ),
    );
  }
}
