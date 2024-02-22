import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/visibility/side_menu_shown.dart';
import '/presentation/references/references.barrel.dart';
import 'side_menu_element.dart';

class SideMenuOptions extends StatelessWidget {
  const SideMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SideMenu(
      sideMenuTitle: "Menu de opciones",
      sideMenuElements: [
        DarkModeSection(),
      ],
    );
  }
}

class _SideMenu extends ConsumerWidget {
  final String sideMenuTitle;
  final List<Widget> sideMenuElements;

  const _SideMenu({
    required this.sideMenuTitle,
    required this.sideMenuElements,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSideMenuShown = ref.watch(sideMenuShownProvider);

    return Visibility(
      visible: onSideMenuShown,
      child: LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth * 0.75,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Column(
              children: [
                Text(
                  sideMenuTitle,
                  style: ref.titleText().copyWith(fontSize: 18),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: sideMenuElements,
                      ),
                    ),
                  ),
                ),
                Text(
                  "v5.42.56",
                  style: ref.normalText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
