import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/is_dismissible_provider.dart';

import '../../../references/utils/utils_reference.dart';
import '/data/domain/entities/product.dart';
import '/presentation/providers/providers.barrel.dart';
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
