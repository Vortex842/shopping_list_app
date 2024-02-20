// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/inherited/button_actions_inherited.dart';

import '/data/domain/entities/product.dart';
import '/presentation/enums/button_action_type.dart';
import '../../../providers/on_change_states/on_tap_product_provider.dart';
import '../../../references/references.barrel.dart';
import 'button_actions.dart';
import 'button_section.dart';
import 'icons_product_section.dart';

class ShoppingButton extends StatefulHookConsumerWidget {
  final Product product;

  const ShoppingButton({required this.product, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingButtonState();
}

class _ShoppingButtonState extends ConsumerState<ShoppingButton>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final onTapProduct = ref.watch(onTapProductProvider);

    final buttonAction = useState(ButtonActionType.none);
    final dismissDirection = useState(DismissDirection.none);

    useEffect(() {
      buttonAction.value = widget.product.isChecked
          ? ButtonActionType.select
          : dismissDirection.value == DismissDirection.startToEnd
              ? ButtonActionType.edit
              : dismissDirection.value == DismissDirection.endToStart
                  ? ButtonActionType.delete
                  : ButtonActionType.none;
      return null;
    }, [widget.product.isChecked, dismissDirection.value]);

    return GestureDetector(
      onTap: onTapProduct ? () => ref.onTapProductButton(widget.product) : null,
      child: ClipRRect(
        borderRadius: ref.buttonRadius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: ref.buttonProductHeight,
          decoration: ref.buttonBackgroundDecoration(
            actionType: buttonAction.value,
          ),
          child: Stack(
            children: [
              IconsProductSection(buttonAction: buttonAction),
              ButtonDataInherited(
                product: widget.product,
                buttonSection: ButtonSection(widget.product),
                dismissDirection: dismissDirection,
                child: const ButtonActions(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
