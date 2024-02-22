import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/data/classes/product_class/hive_data.dart';
import '/data/classes/product_class/product.dart';
import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';
import 'shopping_products_section.dart';

class ShoppingBody extends StatefulHookConsumerWidget {
  const ShoppingBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingBodyState();
}

class _ShoppingBodyState extends ConsumerState<ShoppingBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final products = ref.watch(productsProvider);
    final onAddCart = ref.watch(onAddCartProvider);

    return Container(
      width: double.infinity,
      decoration: ref.bodyDecoration(),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: products.isEmpty && !onAddCart
            ? const LoadingProductData()
            : const ScrollableProductBody(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class LoadingProductData extends ConsumerWidget {
  const LoadingProductData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder<List<Product>>(
            future: HiveData.products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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

              return const EmptyProductsBody();
            },
          ),
        ),
      ),
    );
  }
}

class ScrollableProductBody extends ConsumerWidget {
  const ScrollableProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);
    final total = onAddCart ? ref.watch(totalCostProvider) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            !onAddCart ? "Por comprar" : "Ya comprado",
            style: ref.normalText(),
          ),
          const Expanded(
            child: ShoppingProductsSection(),
          ),
          Visibility(
            visible: onAddCart,
            child: Text(
              "Total: \$$total",
              style: ref.totalText(),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyProductsBody extends ConsumerWidget {
  const EmptyProductsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double imgSize = 140;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage('assets/icon.png'),
              width: imgSize,
              height: imgSize,
            ),
            const SizedBox(height: 20),
            Text(
              'Apreta el boton + para agregar un nuevo producto',
              style: ref.normalText().copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
