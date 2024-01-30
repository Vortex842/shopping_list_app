import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/focus_nodes_providers.dart';
import '../shopping_text_editable.dart';

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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductEditableText(),
            AmountEditableText(),
            PriceEditableText(),
          ],
        ),
      ),
    );
  }
}
