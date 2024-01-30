import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/color_reference.dart';
import 'package:uuid/uuid.dart';

import '../../../../../data/domain/entities/product.dart';
import '../../../../providers/providers.barrel.dart';
import 'add_edit_texts.dart';

void closeAddEditSection(WidgetRef ref) {
  ref.read(controllerProviders).forEach((controller) => controller.text = '');

  ref.read(onAddEditProvider.notifier).update((state) => false);
}

class AddEditSection extends ConsumerWidget {
  const AddEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          ref.read(focusProviders).forEach((focus) => focus.dispose());
        },
        child: const Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTextSection(),
                AmountTextSection(),
                PriceTextSection(),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: DoneProductButton(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CloseProductButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class DoneProductButton extends ConsumerWidget {
  const DoneProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return IconButton(
      onPressed: () {
        log("Done");

        final productText = ref.read(productControllerProvider);
        final amountText = ref.read(amountControllerProvider);
        final priceText = ref.read(priceControllerProvider);

        if (productText.text.isNotEmpty && amountText.text.isNotEmpty) {
          if (priceText.text.isEmpty) priceText.text = '0';

          ref.read(productsProvider.notifier).addProduct(
                Product(
                  id: const Uuid().v4(),
                  name: productText.text,
                  amount: int.parse(amountText.text),
                  price: double.parse(priceText.text),
                ),
              );

          closeAddEditSection(ref);
        }
      },
      icon: Icon(
        LucideIcons.chevronRight,
        size: 35,
        color: ref.foregroundColor(isDark),
      ),
    );
  }
}

class CloseProductButton extends ConsumerWidget {
  const CloseProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return IconButton(
      onPressed: () {
        log("Done");

        closeAddEditSection(ref);
      },
      icon: Icon(
        LucideIcons.x,
        size: 30,
        color: ref.foregroundColor(isDark),
      ),
    );
  }
}
