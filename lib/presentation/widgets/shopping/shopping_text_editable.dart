import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/focus_nodes_providers.dart';

import '/presentation/providers/dark_mode_provider.dart';
import '/presentation/references/references.barrel.dart';

class _ShoppingEditableText extends HookConsumerWidget {
  final TextInputType textType;
  final FocusNode focusNode;

  const _ShoppingEditableText({
    required this.textType,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    final controller = useTextEditingController();

    return SizedBox(
      width: ref.editableTextWidth(textType),
      child: InputDecorator(
        decoration: InputDecoration(
          isCollapsed: true,
          fillColor: ref.editableTextColor(isDark),
          filled: true,
          border: const OutlineInputBorder(),
          // border: InputBorder.none,
        ),
        child: EditableText(
          controller: controller,
          focusNode: focusNode,
          style: ref.normalText().copyWith(height: 1.8),
          cursorHeight: 18,
          cursorOffset: const Offset(0, 5),
          cursorColor: Colors.black87,
          backgroundCursorColor: Colors.transparent,
          keyboardType: textType,
        ),
      ),
    );
  }
}

class ProductEditableText extends ConsumerWidget {
  const ProductEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNodeProduct = ref.watch(focusNodeProductProvider);

    return _ShoppingEditableText(
      textType: TextInputType.text,
      focusNode: focusNodeProduct,
    );
  }
}

class AmountEditableText extends ConsumerWidget {
  const AmountEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNodeAmount = ref.watch(focusNodeAmountProvider);

    return _ShoppingEditableText(
      textType: TextInputType.phone,
      focusNode: focusNodeAmount,
    );
  }
}

class PriceEditableText extends ConsumerWidget {
  const PriceEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNodePrice = ref.watch(focusNodePriceProvider);

    return _ShoppingEditableText(
      textType: TextInputType.number,
      focusNode: focusNodePrice,
    );
  }
}
