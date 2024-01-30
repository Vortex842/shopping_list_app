import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/buttons/buttons_bottombar.barrel.dart';

class AddSearchButtons extends StatelessWidget {
  const AddSearchButtons({
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
