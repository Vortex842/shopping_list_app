import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/on_change_states/on_add_cart_provider.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() => runApp(const ProviderScope(child: MainApp()));

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ShoppingFont',
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: ref.pageColor(),
          appBar: const ShoppingAppBar(),
          body: Column(
            children: [
              const Expanded(
                child: ShoppingBody(),
              ),
              if (!onAddCart) const ShoppingBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
