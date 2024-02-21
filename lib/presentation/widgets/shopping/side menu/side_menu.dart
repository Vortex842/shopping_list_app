import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/references/references.barrel.dart';
import '/presentation/widgets/shopping/side%20menu/side_menu_element.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, constraints) => SizedBox(
        width: constraints.maxWidth * 0.75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      DarkModeSection(),
                    ],
                  ),
                ),
              ),
              Text(
                "v5.42.55",
                style: ref.normalText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
