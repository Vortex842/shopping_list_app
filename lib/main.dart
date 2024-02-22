import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/data/classes/product_class/hive_data.dart';

import 'data/classes/product_class/product.dart';
import 'presentation/providers/product/product_list_provider.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/body/shopping_body_animated.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';
import 'presentation/widgets/shopping/side_menu/side_menu.dart';

void main() async {
  // var env = DotEnv()..load();

  // print(env["SUPABASE_URL"]);
  // print(env["SUPABASE_ANON_KEY"]);

  var path = Directory.current.path;

  Hive
    ..init(path)
    ..registerAdapter(ProductAdapter());

  runApp(
    const ProviderScope(
      child: LoadingaProductData(),
    ),
  );
}

class LoadingaProductData extends ConsumerWidget {
  const LoadingaProductData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder<List<Product>>(
            future: HiveData.products,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const double sizeImg = 120;

                return const Center(
                  child: Image(
                    image: AssetImage('assets/icon.png'),
                    width: sizeImg,
                    height: sizeImg,
                  ),
                );
              }

              final products = snapshot.data!;

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ref.read(productsProvider.notifier).addAll(
                      products,
                    );
                HiveData.closeDB();
              });

              return const MainApp();
            },
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
      home: Scaffold(
        backgroundColor: ref.pageColor(),
        appBar: const ShoppingAppBar(),
        body: const Stack(
          children: [
            SideMenuOptions(),
            ShoppingAnimatedBody(),
          ],
        ),
      ),
    );
  }
}
