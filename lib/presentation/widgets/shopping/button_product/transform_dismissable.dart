import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/data/domain/entities/product.dart';
import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/utils_reference.dart';
import 'button_section.dart';

class TransformButton extends StatelessWidget {
  final ButtonSection child;

  const TransformButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(0.95, 0.8),
        child: child,
      ),
    );
  }
}

class DismissibleButton extends ConsumerWidget {
  final Product product;
  final ValueNotifier<DismissDirection> dismissDirection;
  final ButtonSection child;

  const DismissibleButton({
    super.key,
    required this.product,
    required this.dismissDirection,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onMultiSelect = ref.watch(onMultiSelectProvider);
    final onAddEdit = ref.watch(onAddEditProvider);

    return Dismissible(
      key: Key(product.id),
      direction: onMultiSelect || onAddEdit
          ? DismissDirection.none
          : DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          ref.read(productsProvider.notifier).toggleCheck(
                product.id,
              );
          ref.read(onProductDeleteProvider.notifier).update(
                (state) => true,
              );
          // ref.read(productsProvider.notifier).deleteProduct(
          //       product.id,
          //     );
          print("Delete - ${product.toString()}");
        } else {
          ref.activeEditableProduct(product);
          print("Edit - ${product.toString()}");
        }

        return false;
      },
      onUpdate: (details) {
        if (details.direction != dismissDirection.value) {
          dismissDirection.value = details.direction;
        }
        if (details.progress == 0) {
          dismissDirection.value = DismissDirection.none;
        }
      },
      child: child,
    );
  }
}
