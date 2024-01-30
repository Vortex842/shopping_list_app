import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'buttons/add_search_buttons.dart';

class ShoppingBottom extends ConsumerWidget {
  const ShoppingBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);
    final isAnyChecked = ref.watch(onMultiSelectProvider);
    final onAddEdit = ref.watch(onAddEditProvider);

    return Container(
      width: double.infinity,
      height: ref.bottomHeight(onAddEdit),
      decoration: ref.bottomDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            // TODO: Create Actions: 'selected' and 'Accept or Cancel'
            alignment: !isAnyChecked || onAddEdit
                ? Alignment.center
                : Alignment.centerLeft,
            child: isAnyChecked
                ? const MultiSelectSection()
                : onAddEdit
                    ? const AddEditSection()
                    : const AddSearchButtons(),
          ),
        ),
      ),
    );
  }
}

class MultiSelectSection extends StatelessWidget {
  const MultiSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      color: Colors.red,
    );
  }
}

class AddEditSection extends StatelessWidget {
  const AddEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      color: Colors.green,
    );
  }
}
