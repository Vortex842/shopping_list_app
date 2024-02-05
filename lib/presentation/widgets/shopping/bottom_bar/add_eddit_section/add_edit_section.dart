import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/add_eddit_section/text_sections.dart';

import '../../../../providers/providers.barrel.dart';
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
        child: const Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameTextSection(),
                  AmountTextSection(),
                  PriceTextSection(),
                ],
              ),
            ),
            Column(
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
