import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/bottombar_buttons/buttons_bottombar.barrel.dart';

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AddProductButton(),
        SearchProductButton(),
      ],
    );
  }
}
