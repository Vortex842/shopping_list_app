import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';

import '../../providers/on_done_provider.dart';
import '../../providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';
import 'button_product/button_section.dart';

class _ShoppingEditableText extends HookConsumerWidget {
  final String initialText;
  final EditableTextType textType;
  final double maxWidth;
  final void Function(WidgetRef ref, String value) callback;

  const _ShoppingEditableText({
    required this.initialText,
    required this.textType,
    required this.maxWidth,
    required this.callback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = useState<Timer?>(null);
    final controller = useTextEditingController(text: initialText);
    final onDone = ref.watch(onDoneProvider);

    return SizedBox(
      width: maxWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            timer.value?.cancel();
            timer.value = Timer(
              const Duration(milliseconds: 500),
              () {
                ref.read(onDoneProvider.notifier).update(
                      (onDone) => false,
                    );
                callback(ref, value);
              },
            );
          },
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
            contentPadding: const EdgeInsets.all(10),
            hintText: textType.txt,
            hintStyle: ref.normalText(),
            error: onDone && ref.isFailController(textType)
                ? TextScrollName(
                    text: ref.errorText(textType),
                    style: ref.normalText().copyWith(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                  )
                : null,
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
    return _ShoppingEditableText(
      initialText: ref.watch(nameControllerProvider),
      textType: EditableTextType.name,
      maxWidth: double.infinity,
      callback: (ref, value) {
        ref.read(nameControllerProvider.notifier).update(
          (text) {
            return value;
          },
        );
      },
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
      callback: (ref, value) {
        ref.read(amountControllerProvider.notifier).update(
          (text) {
            return value;
          },
        );
      },
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
      callback: (ref, value) {
        ref.read(priceControllerProvider.notifier).update(
          (text) {
            return value;
          },
        );
      },
    );
  }
}
