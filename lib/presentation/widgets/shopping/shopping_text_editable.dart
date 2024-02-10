import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';

import '../../providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';

class _ShoppingEditableText extends HookConsumerWidget {
  final EditableTextType textType;
  final double maxWidth;
  final TextEditingController controller;

  const _ShoppingEditableText({
    required this.textType,
    required this.maxWidth,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return SizedBox(
      width: maxWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: ref.editableText().copyWith(
                height: 1.2,
              ),
          cursorHeight: 18,
          cursorColor: ref.foregroundColor(),
          keyboardType: textType == EditableTextType.name
              ? TextInputType.text
              : TextInputType.number,
          decoration: InputDecoration(
            isDense: true,

            fillColor: ref.editableTextColor(),
            filled: true,
            // border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(10),
            hintText: textType.txt,
            hintStyle: ref.normalText(),
          ),
        ),
      ),
    );
  }
}

class NameEditableText extends ConsumerWidget {
  const NameEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);

    return _ShoppingEditableText(
      textType: EditableTextType.name,
      maxWidth: double.infinity,
      controller: nameController,
    );
  }
}

class AmountEditableText extends ConsumerWidget {
  const AmountEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = ref.watch(amountControllerProvider);

    return _ShoppingEditableText(
      textType: EditableTextType.amount,
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
    final priceController = ref.watch(priceControllerProvider);

    return _ShoppingEditableText(
      textType: EditableTextType.price,
      maxWidth: ref.editablePriceWidth,
      controller: priceController,
    );
  }
}
