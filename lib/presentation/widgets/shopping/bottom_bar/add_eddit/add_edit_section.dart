import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

import '../../../../providers/providers.barrel.dart';
import 'close_product_button.dart';
import 'done_product_button.dart';

class AddEditSection extends ConsumerWidget {
  const AddEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          ref.read(focusProviders).forEach((focus) => focus.dispose());
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.red[100],
                        ),
                        Container(
                          width: ref.editableAmountWidth,
                          height: 30,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.red[300],
                        ),
                        Container(
                          width: ref.editablePriceWidth,
                          height: 30,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CloseProductButton(),
                DoneProductButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
