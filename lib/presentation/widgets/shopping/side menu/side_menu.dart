import 'package:flutter/material.dart';

import '/presentation/widgets/shopping/side%20menu/side_menu_element.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SizedBox(
        width: constraints.maxWidth * 0.75,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DarkModeSection(),
            ],
          ),
        ),
      ),
    );
  }
}
