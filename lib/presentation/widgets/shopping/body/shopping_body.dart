import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final hiveDataMain = ref.read(hiveDataMainProvider);
    final hiveDataCart = ref.read(hiveDataCartProvider);

    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          hiveDataMain.products.then((mainList) {
            ref.read(productsProvider.notifier).addAll(mainList);
          });

          hiveDataCart.products.then((cartList) {
            ref.read(productsCartProvider.notifier).addAll(cartList);
          });
        });

        return const EmptyProductsBody();
      },
    );
  }
}
