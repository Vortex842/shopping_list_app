import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/palette/color_theme.dart';

import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Foslin',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: context.pageColor(false),
        appBar: const ShoppingAppBar(),
        body: const Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ShoppingBody(),
              ),
            ),
            Placeholder(
              fallbackHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}
