import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/classes/product_class/product.dart';
import 'presentation/references/references.barrel.dart';
import 'presentation/widgets/shopping/body/shopping_body_animated.dart';
import 'presentation/widgets/shopping/shopping.barrel.dart';
import 'presentation/widgets/shopping/side_menu/side_menu.dart';

void main() async {
  // var env = DotEnv()..load();

  // print(env["SUPABASE_URL"]);
  // print(env["SUPABASE_ANON_KEY"]);

  var path = Directory.systemTemp.path;

  print(path);

  Hive
    ..init(path)
    ..registerAdapter(ProductAdapter());

  runApp(
    const ProviderScope(
      child: MainApp(),
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
