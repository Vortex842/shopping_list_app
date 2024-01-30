import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shopping_text_editable.dart';

class AddEditSection extends ConsumerWidget {
  const AddEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // width: 100,
      // color: Colors.green,
      child: const Center(
        child: ShoppingTextEditable(),
      ),
    );
  }
}
