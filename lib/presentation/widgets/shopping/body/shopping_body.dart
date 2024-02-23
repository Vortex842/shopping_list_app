import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/classes/product_class/hive_data.dart';
import '/classes/product_class/product.dart';
import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';
import 'empty_products_body.dart';
import 'scrollable_product_body.dart';

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
    final hiveDataMain = ref.watch(hiveDataMainProvider);

    return FutureBuilder<List<Product>>(
      future: hiveDataMain.products,
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

        return const EmptyProductsBody();
      },
    );
  }
}
