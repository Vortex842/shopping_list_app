import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/product_list_provider.dart';
import '/presentation/references/utils_reference.dart';

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
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              onPressed: () {
                ref.read(productsProvider.notifier).deleteProductsSelected();
                ref.whenConfirmCancel();
              },
              child: const Text("Aceptar"),
            ),
            TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
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
