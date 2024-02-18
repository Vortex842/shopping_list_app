// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/inherited/button_actions_inherited.dart';

import '/data/domain/entities/product.dart';
import '/presentation/enums/button_action_type.dart';
import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'button_product_actions.dart';
import 'button_section.dart';
import 'icon_action_button.dart';

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
    final onAddEdit = ref.watch(onAddEditProvider);
    final onConfirm = ref.watch(onConfirmCancelProvider);

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
      onTap: !onAddEdit && !onConfirm
          ? () => ref.onTapProductButton(widget.product)
          : null,
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
              Align(
                alignment: buttonAction.value == ButtonActionType.edit
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: IconActionButton(
                    btnAction: buttonAction.value,
                  ),
                ),
              ),
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
