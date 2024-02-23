import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';

class ClearTablesDB extends ConsumerWidget {
  const ClearTablesDB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SideMenuElement(
      icon: LucideIcons.fileX2,
      info: "Borrar base de datos",
      action: () {
        final hiveDataMain = ref.read(hiveDataMainProvider);
        final hiveDataCart = ref.read(hiveDataCartProvider);

        final onAddCart = ref.read(onAddCartProvider);

        hiveDataMain.clearAll();
        hiveDataCart.clearAll();

        ref.read(productsProvider.notifier)
          ..checkAll()
          ..deleteProductsSelected();

        ref.read(productsCartProvider.notifier)
          ..checkAll()
          ..deleteProductsSelected();

        if (onAddCart) {
          ref.onCartButtonPress();
        }
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
      info: "Modo ${isDarkMode ? "claro" : "oscuro"}",
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
            child: Row(
              children: [
                Icon(
                  icon,
                  color: ref.foregroundColor(),
                ),
                const SizedBox(width: 10),
                Text(info, style: ref.normalText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
