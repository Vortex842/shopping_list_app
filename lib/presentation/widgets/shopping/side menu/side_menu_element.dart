import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/dark_mode_provider.dart';

class DarkModeSection extends StatelessWidget {
  const DarkModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _SideMenuElement(
      icon: Icons.dark_mode,
      info: const Text("Modo oscuro"),
      action: (ref) => Switch(
        value: ref.watch(isDarkProvider),
        onChanged: (value) {
          ref.read(isDarkProvider.notifier).update((state) => value);

          print("Dark mode press");
        },
      ),
    );
  }
}

class _SideMenuElement extends ConsumerWidget {
  final IconData icon;
  final Widget info;
  final Widget Function(WidgetRef ref)? action;

  const _SideMenuElement({
    required this.icon,
    required this.info,
    this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        info,
        action!(ref),
      ],
    );
  }
}
