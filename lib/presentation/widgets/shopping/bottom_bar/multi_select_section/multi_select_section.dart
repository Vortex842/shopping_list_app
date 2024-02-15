import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/on_change_states/on_add_cart_provider.dart';
import 'icons_multi_select.dart';

class MultiSelectSection extends ConsumerWidget {
  const MultiSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: [
          const IconSelectAll(),
          const IconUnselectAll(),
          onAddCart
              ? const IconUndoCartSelected()
              : const IconAddCartSelected(),
        ],
      ),
    );
  }
}
