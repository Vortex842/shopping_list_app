import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/providers.barrel.dart';

class BaseSection extends ConsumerWidget {
  const BaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSideMenuActive = ref.watch(onSideMenuActiveProvider);

    return Center(
      child: SizedBox(
        child: FloatingActionButton(
          mini: true,
          onPressed: onSideMenuActive
              ? null
              : () {
                  // ADD PRODUCT BUTTON
                  ref.read(onAddEditProvider.notifier).update((state) => true);
                  ref.read(controllerProviders).forEach(
                        (providerText) => ref
                            .read(providerText.notifier)
                            .update((state) => state != '' ? '' : state),
                      );
                },
          child: const Icon(
            LucideIcons.plus,
            size: 30,
          ),
        ),
      ),
    );
  }
}
