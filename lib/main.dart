import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            Expanded(flex: 1, child: Placeholder()),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Placeholder(),
                      )),
                  Expanded(flex: 1, child: Placeholder()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
