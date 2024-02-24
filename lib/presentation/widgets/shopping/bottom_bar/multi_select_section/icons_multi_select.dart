import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/color_reference.dart';
import '/presentation/references/utils/utils_reference.dart';

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
    return _IconsMultiSelect(
      icon: LucideIcons.listX,
      callback: (ref) {
        ref.unselectList();
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
      callback: (ref) async {
        final dbProductsMain = ref.read(dbProductsMainProvider);
        final dbProductsCart = ref.read(dbProductsCartProvider);

        final products = ref.read(productsProvider);
        final productsChecked = products.where((p) => p.isChecked).toList();

        dbProductsMain.clearAllProducts(productsChecked);
        dbProductsCart.saveAllProducts(productsChecked);

        ref.read(productsCartProvider.notifier).addAll(productsChecked);
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
      callback: (ref) async {
        final dbProductsMain = ref.read(dbProductsMainProvider);
        final dbProductsCart = ref.read(dbProductsCartProvider);

        final productsCart = ref.read(productsCartProvider);
        final productsCartChecked =
            productsCart.where((p) => p.isChecked).toList();

        dbProductsMain.saveAllProducts(productsCartChecked);
        dbProductsCart.clearAllProducts(productsCartChecked);

        ref.read(productsProvider.notifier).addAll(productsCartChecked);
        ref.read(productsCartProvider.notifier).deleteProductsSelected();

        final productsOnCart = ref.read(productsCartProvider);
        if (productsOnCart.isEmpty) {
          ref.onCartButtonPress();
        }
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
      icon: LucideIcons.trash2,
      callback: (ref) {
        ref.read(onConfirmCancelProvider.notifier).update(
              (state) => true,
            );
      },
    );
  }
}
