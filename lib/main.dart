import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() => runApp(const ProviderScope(child: SplashScreen()));

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future future = useMemoized(
      () => Future.delayed(
        const Duration(seconds: 5),
      ),
    );

    future.timeout(
      const Duration(seconds: 2),
      onTimeout: () {
        future.ignore();
        print("no puedo esperar tanto por los productos");
      },
    );

    final snapshot = useFuture(future);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ShoppingFont',
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: snapshot.connectionState == ConnectionState.waiting
                ? const Image(
                    image: AssetImage('assets/icon.png'),
                  )
                : const MainApp(),
          ),
        ),
      ),
    );
  }
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
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
    );
  }
}
