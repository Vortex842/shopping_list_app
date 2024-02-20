// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/inherited/button_actions_inherited.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/button_product/button_product_actions.dart';

class ButtonActions extends ConsumerWidget {
  const ButtonActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);

    final product = ButtonDataInherited.of(context)!.product;
    final buttonSection = ButtonDataInherited.of(context)!.buttonSection;
    final dismissDirection = ButtonDataInherited.of(context)!.dismissDirection;

    return product.isChecked
        ? onAddCart
            ? LeaveCartAction(
                product: product,
                child: buttonSection,
              )
            : CheckedAction(child: buttonSection)
        : EditDeleteAction(
            product: product,
            dismissDirection: dismissDirection,
            child: buttonSection,
          );
  }
}
