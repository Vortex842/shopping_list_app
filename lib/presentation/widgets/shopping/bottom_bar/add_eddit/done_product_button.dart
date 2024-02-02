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

        final nameController = ref.read(nameControllerProvider);
        final amountController = ref.read(amountControllerProvider);
        final priceController = ref.read(priceControllerProvider);
        final isEmptyFields = ref.read(isEmptyFieldsProvider);
        final productToEdit = ref.read(newProductProvider);

        if (isEmptyFields) {
          if (priceController.text.isEmpty) priceController.text = '0';

          if (productToEdit != null) {
            ref.read(productsProvider.notifier).editProductById(
                  id: productToEdit.id,
                  name: nameController.text,
                  amount: int.parse(amountController.text),
                  price: double.parse(priceController.text),
                );
          } else {
            ref.read(productsProvider.notifier).addProduct(
                  Product(
                    id: const Uuid().v4(),
                    name: nameController.text,
                    amount: int.parse(amountController.text),
                    price: double.parse(priceController.text),
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
