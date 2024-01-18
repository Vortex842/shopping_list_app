import 'package:flutter/material.dart';

import '../../palette/color_theme.dart';
import 'shopping_button.dart';

class ShoppingBody extends StatelessWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.bodyColor(false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: List.generate(
              10,
              (index) => ShoppingButton(
                name: "Product ${index + 1}",
                price: index * 3.333999,
                amount: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
