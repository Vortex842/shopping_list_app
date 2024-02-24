import 'package:flutter/material.dart';

import 'icon_shop_cart.dart';
import 'icon_side_menu.dart';
import 'tittle_app_bar.dart';

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
