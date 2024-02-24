import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

class EmptyProductsBody extends ConsumerWidget {
  const EmptyProductsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double imgSize = 140;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage('assets/icon.png'),
              width: imgSize,
              height: imgSize,
            ),
            const SizedBox(height: 20),
            Text(
              'Apreta el boton + para agregar un nuevo producto',
              style: ref.normalText().copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
