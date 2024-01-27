// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';
import 'package:shopping_list_app/presentation/providers/product_inherited.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import '/data/domain/entities/product.dart';
import 'button_section.dart';

class ShoppingButton extends HookConsumerWidget {
  final Product product;

  const ShoppingButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    final buttonAction = useState(ButtonActionType.none);
    final dismissDirection = useState(DismissDirection.none);
    final buttonSection = useMemoized(
      () => ButtonSection(product),
    );

    useEffect(() {
      buttonAction.value = product.isChecked
          ? ButtonActionType.select
          : dismissDirection.value == DismissDirection.startToEnd
              ? ButtonActionType.edit
              : dismissDirection.value == DismissDirection.endToStart
                  ? ButtonActionType.delete
                  : ButtonActionType.none;
      return null;
    }, [product.isChecked, dismissDirection.value]);

    return GestureDetector(
      onLongPress: () {
        // ACTION ON LONG PRESS
        ref.read(productsProvider.notifier).toggleCheck(product.id);
      },
      child: Container(
        height: 60,
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
              ProductInherited(
                product: product,
                child: product.isChecked
                    ? TransformButton(child: buttonSection)
                    : DismissibleButton(
                        // key: Key(product.hashCode.toString()),
                        dismissDirection: dismissDirection,
                        child: buttonSection,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      case ButtonActionType.edit:
        icon = LucideIcons.edit;
        color = ref.editColor(true);
      case ButtonActionType.delete:
        icon = LucideIcons.delete;
        color = ref.deleteColor(true);
      case ButtonActionType.select:
        icon = LucideIcons.check;
        color = ref.selectColor(true);
    }

    return Icon(icon, color: color);
  }
}
