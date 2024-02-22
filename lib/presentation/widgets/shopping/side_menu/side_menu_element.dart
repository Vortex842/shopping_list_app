import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shopping_list_app/data/classes/product_class/hive_data.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

import '/presentation/providers/dark_mode_provider.dart';

class ClearTablesDB extends ConsumerWidget {
  const ClearTablesDB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SideMenuElement(
      icon: LucideIcons.fileX2,
      info: "Borrar lista de productos",
      action: () {
        HiveData.clearAll();
      },
    );
  }
}

class DarkModeAction extends ConsumerWidget {
  const DarkModeAction({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkProvider);

    return _SideMenuElement(
      icon: isDarkMode ? Icons.light_mode : Icons.dark_mode,
      info: "Modo oscuro",
      action: () {
        ref.read(isDarkProvider.notifier).update((state) => !state);
      },
    );
  }
}

class _SideMenuElement extends ConsumerWidget {
  final IconData icon;
  final String info;
  final void Function() action;

  const _SideMenuElement({
    required this.icon,
    required this.info,
    required this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        child: InkWell(
          onTap: action,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Wrap(
              spacing: 10,
              children: [
                Icon(
                  icon,
                  color: ref.foregroundColor(),
                ),
                Text(info, style: ref.normalText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
