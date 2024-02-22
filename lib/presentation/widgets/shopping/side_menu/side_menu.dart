import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
        DarkModeAction(),
        ClearTablesDB(),
      ],
    );
  }
}

class _SideMenu extends HookConsumerWidget {
  final String sideMenuTitle;
  final List<Widget> sideMenuElements;

  const _SideMenu({
    required this.sideMenuTitle,
    required this.sideMenuElements,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSideMenuShown = ref.watch(sideMenuShownProvider);

    final pubspecInfo = useFuture(PackageInfo.fromPlatform());

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: sideMenuElements,
                      ),
                    ),
                  ),
                ),
                Text(
                  "By Vortex - v${pubspecInfo.data!.version}",
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
