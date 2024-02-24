import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import 'data/classes/product_class/product.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/body/shopping_body_animated.dart';
import 'presentation/widgets/shopping.barrel.dart';
import 'presentation/widgets/side_menu/side_menu.dart';

void main() async {
  var path = Directory.systemTemp.path;

  Hive
    ..init(path)
    ..registerAdapter(ProductAdapter());

  runApp(
    const ProviderScope(
      child: LoadingProductData(),
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
          body: const Stack(
            children: [
              SideMenuOptions(),
              ShoppingAnimatedBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingProductData extends ConsumerWidget {
  const LoadingProductData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          final dbProductsMain = ref.read(dbProductsMainProvider);
          final dbProductsCart = ref.read(dbProductsCartProvider);

          final products = ref.read(productsProvider);
          final productsCart = ref.read(productsCartProvider);

          if (products.isEmpty) {
            dbProductsMain.products.then((mainList) {
              ref.read(productsProvider.notifier).addAll(mainList);
            });
          }
          if (productsCart.isEmpty) {
            dbProductsCart.products.then((cartList) {
              ref.read(productsCartProvider.notifier).addAll(cartList);
            });
          }
        });

        return const MainApp();
      },
    );
  }
}
