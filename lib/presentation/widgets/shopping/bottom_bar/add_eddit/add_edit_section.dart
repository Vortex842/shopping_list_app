import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.barrel.dart';
import 'add_edit_texts.dart';
import 'close_product_button.dart';
import 'done_product_button.dart';

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
