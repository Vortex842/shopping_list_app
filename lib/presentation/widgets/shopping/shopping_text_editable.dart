import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';
import 'package:shopping_list_app/presentation/providers/editable_text_provider.dart';
import 'package:shopping_list_app/presentation/providers/focus_nodes_providers.dart';

import '/presentation/providers/dark_mode_provider.dart';
import '/presentation/references/references.barrel.dart';

class _ShoppingEditableText extends HookConsumerWidget {
  final EditableTextType textType;
  final FocusNode focusNode;
  final double maxWidth;
  final TextEditingController controller;

  const _ShoppingEditableText({
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
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: ref.editableText().copyWith(
              height: 1.2,
            ),
        cursorHeight: 18,
        cursorColor: ref.foregroundColor(isDark),
        keyboardType: textType == EditableTextType.product
            ? TextInputType.text
            : TextInputType.number,
        decoration: InputDecoration(
          isDense: true,

          fillColor: ref.editableTextColor(isDark),
          filled: true,
          // border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          hintText: textType.name,
          hintStyle: ref.normalText(),
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

    return _ShoppingEditableText(
      textType: EditableTextType.product,
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

    return _ShoppingEditableText(
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

    return _ShoppingEditableText(
      textType: EditableTextType.price,
      focusNode: focusNodePrice,
      maxWidth: ref.editablePriceWidth,
      controller: priceController,
    );
  }
}
