import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/dark_mode_provider.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class ShoppingEditableText extends ConsumerStatefulWidget {
  const ShoppingEditableText({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShoppingEditableTextState();
}

class _ShoppingEditableTextState extends ConsumerState<ShoppingEditableText> {
  @override
  Widget build(BuildContext context) {
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
