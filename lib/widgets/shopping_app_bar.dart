import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
                  icon: const Icon(
                    LucideIcons.alignLeft,
                    size: 25,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Shopping List",
                  style: TextStyle(fontSize: 25),
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
