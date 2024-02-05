import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/size_screen_inherited.dart';
import 'multi_select/icons_multi_select.dart';

class MultiSelectSection extends ConsumerWidget {
  const MultiSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeScreen = SizeScreenInherited.of(context)!.sizeScreen;

    return SizedBox(
      width: sizeScreen!.width * 0.45,
      // color: Colors.green,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconSelectAll(),
          IconUnselectAll(),
          IconDeleteSelected(),
        ],
      ),
    );
  }
}
