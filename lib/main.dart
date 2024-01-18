import 'package:flutter/material.dart';

import 'presentation/palette/color_theme.dart';
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
        backgroundColor: context.pageColor(true),
        appBar: const ShoppingAppBar(),
        body: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ShoppingBody(),
              ),
            ),
            Placeholder(
              fallbackHeight: 60,
              color: context.foregroundColor(true),
            ),
          ],
        ),
      ),
    );
  }
}
