import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/confirm_section/confirm_section.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'add_eddit_section/add_edit_section.dart';
import 'base_section/base_section.dart';
import 'multi_select_section/multi_select_section.dart';

class ShoppingBottom extends ConsumerWidget {
  const ShoppingBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onMultiSelect = ref.watch(onMultiSelectProvider);
    final onAddEdit = ref.watch(onAddEditProvider);
    final onProductDelete = ref.watch(onProductDeleteProvider);
    final sizeScreen = SizeScreenInherited.of(context)!.sizeScreen;

    return Container(
      width: double.infinity,
      height: sizeScreen!.height * ref.bottomHeightPercent(onAddEdit),
      decoration: ref.bottomDecoration(),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: onMultiSelect && !onAddEdit && !onProductDelete
              ? const MultiSelectSection()
              : onAddEdit
                  ? const AddEditSection()
                  : onProductDelete
                      ? const ConfirmSection()
                      : const BaseSection(),
        ),
      ),
    );
  }
}
