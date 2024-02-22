import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';

import '/presentation/providers/dark_mode_provider.dart';

class DarkModeSection extends ConsumerWidget {
  const DarkModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkProvider);

    return _SideMenuElement(
      icon: isDarkMode ? Icons.light_mode : Icons.dark_mode,
      info: Text("Modo oscuro", style: ref.normalText()),
      action: () {
        ref.read(isDarkProvider.notifier).update((state) => !state);
      },
    );
  }
}

class _SideMenuElement extends ConsumerWidget {
  final IconData icon;
  final Widget info;
  final void Function() action;

  const _SideMenuElement({
    required this.icon,
    required this.info,
    required this.action,
    super.key,
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
                info,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
