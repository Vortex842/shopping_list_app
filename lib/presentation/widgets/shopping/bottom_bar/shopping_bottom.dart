import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'add_eddit/add_edit_section.dart';
import 'base_section/base_buttons.dart';
import 'multi_select_section.dart';

class ShoppingBottom extends ConsumerWidget {
  const ShoppingBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnyChecked = ref.watch(onMultiSelectProvider);
    final onAddEdit = ref.watch(onAddEditProvider);
    final sizeScreen = SizeScreenInherited.of(context)!.sizeScreen;

    return Container(
      width: double.infinity,
      height: sizeScreen!.height * ref.bottomHeightPercent(onAddEdit),
      // height: ref.bottomHeight(onAddEdit),
      decoration: ref.bottomDecoration(),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            // TODO: Create Actions:  'Accept or Cancel'
            alignment: !isAnyChecked || onAddEdit
                ? Alignment.center
                : Alignment.centerLeft,
            child: isAnyChecked && !onAddEdit
                ? const MultiSelectSection()
                : onAddEdit
                    ? const AddEditSection()
                    : const BaseButtons(),
          ),
        ),
      ),
    );
  }
}
