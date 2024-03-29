import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';

import '/presentation/references/references.barrel.dart';
import '../providers/providers.barrel.dart';

class _ShoppingEditableText extends HookConsumerWidget {
  final String initialText;
  final EditableTextType textType;
  final double maxWidth;

  const _ShoppingEditableText({
    required this.initialText,
    required this.textType,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = useState<Timer?>(null);
    final controller = useTextEditingController(text: initialText);
    final onDone = ref.watch(onDoneProvider);

    bool anyErrorMessage = onDone && ref.isFailController(textType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: maxWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                ref.updateTextControllers(
                  timer: timer.value,
                  value: value,
                  textType: textType,
                );
              },
              style: ref.editableText().copyWith(height: 1.2),
              cursorHeight: 18,
              cursorColor: ref.foregroundColor(),
              keyboardType: textType == EditableTextType.name
                  ? TextInputType.text
                  : TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                fillColor: ref.editableTextColor(),
                filled: true,
                contentPadding: const EdgeInsets.all(10),
                hintText: textType.txt,
                hintStyle: ref.normalText(),
                error: anyErrorMessage ? const SizedBox() : null,
              ),
            ),
          ),
        ),
        if (anyErrorMessage) ErrorMessageText(textType: textType),
      ],
    );
  }
}

class ErrorMessageText extends ConsumerWidget {
  const ErrorMessageText({
    super.key,
    required this.textType,
  });

  final EditableTextType textType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.errorText(textType),
      style: ref.normalText().copyWith(
            color: Colors.red,
            fontSize: 12,
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
    return _ShoppingEditableText(
      initialText: ref.watch(nameControllerProvider),
      textType: EditableTextType.name,
      maxWidth: double.infinity,
    );
  }
}

class AmountEditableText extends ConsumerWidget {
  const AmountEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ShoppingEditableText(
      initialText: ref.watch(amountControllerProvider),
      textType: EditableTextType.amount,
      maxWidth: ref.editableAmountWidth,
    );
  }
}

class PriceEditableText extends ConsumerWidget {
  const PriceEditableText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ShoppingEditableText(
      initialText: ref.watch(priceControllerProvider),
      textType: EditableTextType.price,
      maxWidth: ref.editablePriceWidth,
    );
  }
}
