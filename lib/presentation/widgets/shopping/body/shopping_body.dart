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
            ? const EmptyProductsBody()
            : const ScrollableProductBody(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
