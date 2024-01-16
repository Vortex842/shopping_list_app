import 'package:flutter/material.dart';

import 'button/shopping_button.dart';

class ShoppingBody extends StatelessWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: List.generate(
              10,
              (index) => const ShoppingButton(),
            ),
          ),
        ),
      ),
    );
  }
}
