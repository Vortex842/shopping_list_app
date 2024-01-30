import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/editable_text_provider.dart';
import 'package:shopping_list_app/presentation/providers/focus_nodes_providers.dart';

import '/presentation/providers/dark_mode_provider.dart';
import '/presentation/references/references.barrel.dart';

class ShoppingEditableText extends HookConsumerWidget {
  final TextInputType textType;
  final FocusNode focusNode;
  final double maxWidth;
  final TextEditingController controller;

  const ShoppingEditableText({
    super.key,
    required this.textType,
    required this.focusNode,
    required this.maxWidth,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return SizedBox(
      width: maxWidth,
      child: InputDecorator(
        decoration: InputDecoration(
          isCollapsed: true,
          fillColor: ref.editableTextColor(isDark),
          filled: true,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 4),
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
    final productController = ref.watch(productControllerProvider);

    return ShoppingEditableText(
      textType: TextInputType.text,
      focusNode: focusNodeProduct,
      maxWidth: ref.editableProductWidth,
      controller: productController,
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
    final amountController = ref.watch(amountControllerProvider);

    return ShoppingEditableText(
      textType: TextInputType.phone,
      focusNode: focusNodeAmount,
      maxWidth: ref.editableAmountWidth,
      controller: amountController,
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
    final priceController = ref.watch(priceControllerProvider);

    return ShoppingEditableText(
      textType: TextInputType.number,
      focusNode: focusNodePrice,
      maxWidth: ref.editablePriceWidth,
      controller: priceController,
    );
  }
}
