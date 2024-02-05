import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/base_section/buttons_bottombar.barrel.dart';

class BaseButtons extends StatelessWidget {
  const BaseButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AddProductButton(),
        FilterProductButton(),
      ],
    );
  }
}
