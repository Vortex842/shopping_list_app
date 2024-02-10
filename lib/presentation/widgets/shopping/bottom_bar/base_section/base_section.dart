import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/bottom_bar/base_section/buttons_bottombar.barrel.dart';

class BaseSection extends StatelessWidget {
  const BaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          AddProductButton(),
          FilterProductButton(),
        ],
      ),
    );
  }
}
