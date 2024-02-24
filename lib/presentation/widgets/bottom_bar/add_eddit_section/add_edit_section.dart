import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/widgets/bottom_bar/add_eddit_section/text_sections.dart';

import 'close_product_button.dart';
import 'done_product_button.dart';

class AddEditSection extends ConsumerWidget {
  const AddEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: const Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 20,
                children: [
                  NameTextSection(),
                  AmountTextSection(),
                  PriceTextSection(),
                ],
              ),
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
    );
  }
}
