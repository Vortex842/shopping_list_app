import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/classes/product%20class/product.dart';
import 'package:shopping_list_app/presentation/providers/is_dismissible_provider.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';
import 'package:shopping_list_app/presentation/references/utils/utils_reference.dart';

class EditDeleteAction extends ConsumerWidget {
  final Product product;
  final ValueNotifier<DismissDirection> dismissDirection;
  final Widget child;

  const EditDeleteAction({
    super.key,
    required this.product,
    required this.dismissDirection,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDismissible = ref.watch(isDismissibleProvider);

    return Dismissible(
      key: Key(product.id),
      direction:
          !isDismissible ? DismissDirection.none : DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        ref.read(productsProvider.notifier).toggleCheck(
              product.id,
            );

        if (direction == DismissDirection.endToStart) {
          ref.read(onConfirmCancelProvider.notifier).update(
                (state) => true,
              );

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
