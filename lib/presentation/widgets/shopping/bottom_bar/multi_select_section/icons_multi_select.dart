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

class IconSelectAll extends ConsumerWidget {
  const IconSelectAll({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    return _IconsMultiSelect(
      icon: Icons.format_list_bulleted_add,
      callback: (ref) {
        if (onAddCart) {
          ref.read(productsCartProvider.notifier).checkAll();
        } else {
          ref.read(productsProvider.notifier).checkAll();
        }
      },
    );
  }
}

class IconUnselectAll extends ConsumerWidget {
  const IconUnselectAll({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    return _IconsMultiSelect(
      icon: LucideIcons.listX,
      callback: (ref) {
        if (onAddCart) {
          ref.read(productsCartProvider.notifier).uncheckAll();
        } else {
          ref.read(productsProvider.notifier).uncheckAll();
        }
      },
    );
  }
}

class IconAddCartSelected extends StatelessWidget {
  const IconAddCartSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _IconsMultiSelect(
      icon: Icons.add_shopping_cart,
      callback: (ref) {
        var products = ref.read(productsProvider);
        products = products.where((p) => p.isChecked).toList();

        ref.read(productsCartProvider.notifier).addAll(products);
        ref.read(productsProvider.notifier).deleteProductsSelected();
      },
    );
  }
}

class IconUndoCartSelected extends StatelessWidget {
  const IconUndoCartSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _IconsMultiSelect(
      icon: Icons.remove_shopping_cart,
      callback: (ref) {
        var productsCart = ref.read(productsCartProvider);
        productsCart = productsCart.where((p) => p.isChecked).toList();

        ref.read(productsProvider.notifier).addAll(productsCart);
        ref.read(productsCartProvider.notifier).deleteProductsSelected();
      },
    );
  }
}
