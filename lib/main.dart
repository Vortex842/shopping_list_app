import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/size_screen_inherited.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() => runApp(const ProviderScope(child: MainApp()));

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, bordes) => SizeScreenInherited(
        sizeScreen: bordes.biggest,
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'ShoppingFont',
          ),
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              backgroundColor: ref.pageColor(),
              appBar: const ShoppingAppBar(),
              body: const Column(
                children: [
                  Expanded(
                    child: ShoppingBody(),
                  ),
                  ShoppingBottom(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
