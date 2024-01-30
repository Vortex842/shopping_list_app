import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/dark_mode_provider.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ShoppingFont',
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: ref.pageColor(isDark),
          appBar: const ShoppingAppBar(),
          body: const Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ShoppingBody(),
                ),
              ),
              ShoppingBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
