import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../palette/color_theme.dart';
import '../../palette/text_theme.dart';

class ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShoppingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, bordes) => SizedBox.fromSize(
        size: Size.fromHeight(bordes.maxHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LucideIcons.alignLeft,
                    size: 25,
                    color: context.foregroundColor(true),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Shopping List",
                  style: context
                      .pruductText(ShoppingSizeText.title)
                      .copyWith(color: context.foregroundColor(true)),
                ),
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
