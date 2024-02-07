import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/product_list_provider.dart';
import '/presentation/references/references.barrel.dart';

class ConfirmSection extends ConsumerWidget {
  const ConfirmSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // color: Colors.green,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              style: ref.buttonConfirmCancelStyle(true),
              onPressed: () {
                ref.read(productsProvider.notifier).deleteProductsSelected();
                ref.whenConfirmCancel();
              },
              child: const Text("Aceptar"),
            ),
            TextButton(
              style: ref.buttonConfirmCancelStyle(false),
              onPressed: () {
                ref.whenConfirmCancel();
              },
              child: const Text("Cancelar"),
            ),
          ],
        ),
      ),
    );
  }
}
