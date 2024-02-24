import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';
import 'package:shopping_list_app/presentation/widgets/bottom_bar/confirm_section.dart';

import '../../providers/providers.barrel.dart';
import 'add_eddit_section/add_edit_section.dart';
import 'base_section.dart';
import 'multi_select_section/multi_select_section.dart';

class ShoppingBottomBar extends ConsumerWidget {
  const ShoppingBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onMultiSelect = ref.watch(multiSelectVisibleProvider);
    final onAddEdit = ref.watch(onAddEditProvider);
    final onConfirm = ref.watch(onConfirmCancelProvider);

    return SizedBox(
      height: ref.bottomHeight(onAddEdit),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: onMultiSelect
              ? const MultiSelectSection()
              : onAddEdit
                  ? const AddEditSection()
                  : onConfirm
                      ? const ConfirmSection()
                      : const BaseSection(),
        ),
      ),
    );
  }
}
