import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import 'data/classes/product_class/product.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/widgets.barrel.dart';

void main() async {
  var path = Directory.systemTemp.path;

  Hive
    ..init(path)
    ..registerAdapter(ProductAdapter());

  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'ShoppingFont',
        ),
        debugShowCheckedModeBanner: false,
        home: const SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: LoadingProductData(),
          ),
        ),
      ),
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

class LoadingProductData extends HookConsumerWidget {
  const LoadingProductData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        final dbSettings = ref.read(dbSettingsProvider);

        return FutureBuilder(
          future: dbSettings.dataMap,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              final dbProductsMain = ref.read(dbProductsMainProvider);
              final dbProductsCart = ref.read(dbProductsCartProvider);

              final settings = snapshot.data ?? {};

              ref
                  .read(isDarkProvider.notifier)
                  .update((state) => settings['dark_mode'] ?? false);

              dbProductsMain.products.then((mainList) {
                ref.read(productsProvider.notifier).addAll(mainList);
              });

              dbProductsCart.products.then((cartList) {
                ref.read(productsCartProvider.notifier).addAll(cartList);
              });
            });

            return const MainApp();
          },
        );
      },
    );
  }
}
