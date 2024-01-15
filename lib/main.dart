import 'package:flutter/material.dart';

import 'widgets/shopping_app_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ShoppingAppBar(),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Placeholder(),
            )),
            Placeholder(
              fallbackHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}
