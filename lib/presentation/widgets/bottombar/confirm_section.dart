import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';

class ConfirmSection extends ConsumerWidget {
  const ConfirmSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(
            style: ref.textButtonStyle(true),
            onPressed: () async {
              final dbProductsMain = ref.read(dbProductsMainProvider);
              final dbProductsCart = ref.read(dbProductsCartProvider);

              final onAddCart = ref.read(onAddCartProvider);
              final products = ref.read(productsProvider);
              final productsCart = ref.read(productsCartProvider);

              if (onAddCart) {
                await dbProductsCart.clearAllProducts(productsCart);

                ref
                    .read(productsCartProvider.notifier)
                    .deleteProductsSelected();

                if (productsCart.isEmpty) {
                  ref.onCartButtonPress();
                }
              } else {
                // print(products);

                await dbProductsMain.clearAllProducts(products);

                ref.read(productsProvider.notifier).deleteProductsSelected();
              }

              ref.whenConfirmCancel();
            },
            child: const Text("Aceptar"),
          ),
          TextButton(
            style: ref.textButtonStyle(false),
            onPressed: () {
              ref.whenConfirmCancel();
            },
            child: const Text("Cancelar"),
          ),
        ],
      ),
    );
  }
}