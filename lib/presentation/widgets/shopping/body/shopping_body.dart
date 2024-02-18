import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
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
      child: products.isEmpty && !onAddCart
          ? const EmptyProductsBody()
          : const ScrollableProductBody(),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
            const SizedBox(height: 25),
            Text(
              'Para agregar un producto apreta el +',
              style: ref.normalText().copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
