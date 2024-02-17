import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/providers/product/product_list_provider.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mjsddegvhgttoqgxgpzd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1qc2RkZWd2aGd0dG9xZ3hncHpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDgwNDg2MjIsImV4cCI6MjAyMzYyNDYyMn0.1rg49gGogJGNb6X5iOSN8SuYo5rYxPubgqNstgybLbI',
  );

  runApp(
    const ProviderScope(
      child: SplashScreen(),
    ),
  );
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

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = Supabase.instance.client
        .from(
          'main_products',
        )
        .select();

    //

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ShoppingFont',
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Image(image: AssetImage('assets/icon.png'));
                }

                final products = snapshot.data!;

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  ref.read(productsProvider.notifier).addAllFromMap(
                        products,
                      );
                });

                return const MainApp();
              },
            ),
          ),
        ),
      ),
    );
  }
}
