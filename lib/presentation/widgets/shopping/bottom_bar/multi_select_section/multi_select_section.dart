import 'package:flutter/material.dart';

import 'icons_multi_select.dart';

class MultiSelectSection extends StatelessWidget {
  const MultiSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: [
          IconSelectAll(),
          IconUnselectAll(),
          IconDeleteSelected(),
        ],
      ),
    );
  }
}
