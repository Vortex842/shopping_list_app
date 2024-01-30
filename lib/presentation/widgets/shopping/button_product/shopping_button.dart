// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import '/data/domain/entities/product.dart';
import 'button_section.dart';

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
    // print("build - shopping button - ${widget.product.toString()}");
    final isDark = ref.watch(isDarkMode);
    final onAddEdit = ref.watch(onAddEditProvider);

    final buttonAction = useState(ButtonActionType.none);
    final dismissDirection = useState(DismissDirection.none);
    final buttonSection = useMemoized(
      () => ButtonSection(widget.product),
    );

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
      onLongPress: !onAddEdit
          ? () {
              // ACTION ON LONG PRESS
              ref.read(productsProvider.notifier).toggleCheck(
                    widget.product.id,
                  );
            }
          : null,
      child: Container(
        height: ref.buttonProductHeight,
        decoration: ref.buttonBackgroundDecoration(
          isDark,
          actionType: buttonAction.value,
        ),
        child: ClipRRect(
          borderRadius: ref.buttonRadius,
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
              widget.product.isChecked
                  ? TransformButton(child: buttonSection)
                  : DismissibleButton(
                      product: widget.product,
                      dismissDirection: dismissDirection,
                      child: buttonSection,
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

class IconActionButton extends ConsumerWidget {
  final ButtonActionType btnAction;

  const IconActionButton({
    this.btnAction = ButtonActionType.none,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData? icon;
    Color color;

    switch (btnAction) {
      case ButtonActionType.none:
        icon = null;
        color = Colors.black;
        break;
      case ButtonActionType.edit:
        icon = LucideIcons.edit;
        color = ref.editColor(true);
        break;
      case ButtonActionType.delete:
        icon = LucideIcons.delete;
        color = ref.deleteColor(true);
        break;
      case ButtonActionType.select:
        icon = LucideIcons.check;
        color = ref.selectColor(true);
        break;
    }

    return Icon(icon, color: color);
  }
}
