import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';
import 'package:shopping_list_app/presentation/providers/editable_text_provider.dart';
import 'package:shopping_list_app/presentation/providers/focus_nodes_providers.dart';

import '/presentation/providers/dark_mode_provider.dart';
import '/presentation/references/references.barrel.dart';

class ShoppingEditableText extends HookConsumerWidget {
  final EditableTextType textType;
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

          labelText: textType.name,
        ),
        child: EditableText(
          controller: controller,
          focusNode: focusNode,
          style: ref.normalText().copyWith(height: 2),
          cursorHeight: 16,
          cursorOffset: const Offset(0, 10),
          cursorColor: Colors.black87,
          backgroundCursorColor: Colors.transparent,
          keyboardType: textType == EditableTextType.product
              ? TextInputType.text
              : TextInputType.number,
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
      textType: EditableTextType.price,
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
      textType: EditableTextType.amount,
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
      textType: EditableTextType.price,
      focusNode: focusNodePrice,
      maxWidth: ref.editablePriceWidth,
      controller: priceController,
    );
  }
}
