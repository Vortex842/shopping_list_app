import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/references/utils_reference.dart';
import 'package:uuid/uuid.dart';

import '/data/domain/entities/product.dart';
import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/color_reference.dart';

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
        final productToEdit = ref.read(editableProductProvider);

        if (productText.text.isNotEmpty && amountText.text.isNotEmpty) {
          if (priceText.text.isEmpty) priceText.text = '0';

          if (productToEdit != null) {
            log(productText.text);
            log(amountText.text);
            log(priceText.text);

            ref.read(productsProvider.notifier).editProductById(
                  id: productToEdit.id,
                  name: productText.text,
                  amount: int.parse(amountText.text),
                  price: double.parse(priceText.text),
                );
          } else {
            ref.read(productsProvider.notifier).addProduct(
                  Product(
                    id: const Uuid().v4(),
                    name: productText.text,
                    amount: int.parse(amountText.text),
                    price: double.parse(priceText.text),
                  ),
                );
          }

          ref.closeAddEditSection(ref);
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
