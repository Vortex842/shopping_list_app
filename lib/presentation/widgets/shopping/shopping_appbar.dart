import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../providers/dark_mode_provider.dart';
import '../../references/references.barrel.dart';

class ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShoppingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, bordes) => SizedBox.fromSize(
        size: Size.fromHeight(bordes.maxHeight),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconSideMenu(),
              ),
              Center(
                child: TittleAppBar(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconShopCart(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class IconShopCart extends ConsumerWidget {
  const IconShopCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        print("Shopping cart");
      },
      icon: Icon(
        LucideIcons.shoppingCart,
        size: 25,
        color: ref.foregroundColor(),
      ),
    );
  }
}

class TittleAppBar extends ConsumerWidget {
  const TittleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      "Shopping List",
      style: ref.titleText(),
    );
  }
}

class IconSideMenu extends ConsumerWidget {
  const IconSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return IconButton(
      onPressed: () {
        ref.read(isDarkProvider.notifier).update(
              (state) => !state,
            );
      },
      icon: Icon(
        isDark ? LucideIcons.alignRight : LucideIcons.alignLeft,
        size: 25,
        color: ref.foregroundColor(),
      ),
    );
  }
}
