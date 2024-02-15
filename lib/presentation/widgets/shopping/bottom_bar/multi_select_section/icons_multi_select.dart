import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';

import '/presentation/references/color_reference.dart';

class _IconsMultiSelect extends ConsumerWidget {
  final IconData icon;
  final void Function(WidgetRef ref) callback;

  const _IconsMultiSelect({
    required this.icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => callback(ref),
      icon: Icon(
        icon,
        color: ref.foregroundColor(),
        size: 25,
      ),
    );
  }
}

class IconSelectAll extends StatelessWidget {
  const IconSelectAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _IconsMultiSelect(
      icon: Icons.format_list_bulleted_add,
      callback: (ref) {
        ref.read(productsProvider.notifier).checkAll();
      },
    );
  }
}

class IconUnselectAll extends StatelessWidget {
  const IconUnselectAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _IconsMultiSelect(
      icon: LucideIcons.listX,
      callback: (ref) {
        ref.read(productsProvider.notifier).uncheckAll();
      },
    );
  }
}

class IconDeleteSelected extends StatelessWidget {
  const IconDeleteSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _IconsMultiSelect(
      icon: Icons.add_shopping_cart,
      callback: (ref) {
        ref.read(onProductDeleteProvider.notifier).update(
              (state) => true,
            );
      },
    );
  }
}
