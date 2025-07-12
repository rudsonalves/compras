import '/ui/core/themes/dimens.dart';
import '/domain/models/item/item_model.dart';
import '/ui/core/themes/fonts.dart';
import '/ui/core/ui/dismissibles/dismissible_container.dart';
import '/utils/extensions/int_extensions.dart';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class DismissibleCart extends StatelessWidget {
  final ItemModel item;
  final void Function(ItemModel item) editItem;
  final Future<bool> Function(ItemModel item) deleteItem;
  final Color? cardColor;

  const DismissibleCart({
    super.key,
    required this.item,
    required this.editItem,
    required this.deleteItem,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final fontStyle = AppFontsStyle.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final dimens = Dimens.of(context);

    final String price = _priceString(
      item.unitPrince,
      item.quantity,
      item.isUnit,
    );
    final String quantity = _valueString(item.quantity, item.isUnit);

    return Dismissible(
      key: UniqueKey(),
      background: dismissibleContainer(
        context,
        alignment: Alignment.centerLeft,
        color: Colors.green.withValues(alpha: 0.45),
        icon: Symbols.edit_square_rounded,
        label: 'Editar',
      ),
      secondaryBackground: dismissibleContainer(
        context,
        alignment: Alignment.centerRight,
        color: Colors.red.withValues(alpha: 0.45),
        icon: Symbols.delete_rounded,
        label: 'Remover',
      ),
      child: Card(
        color: cardColor ?? colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: dimens.borderRadius,
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.all(dimens.paddingScreenAll),
          child: Row(
            spacing: 8,
            children: [
              Expanded(child: Text(item.name)),
              SizedBox(width: 50, child: Center(child: Text(quantity))),
              SizedBox(
                width: 50,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(price, style: fontStyle.bodyTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          editItem(item);
          return false;
        } else if (direction == DismissDirection.endToStart) {
          return await deleteItem(item);
        }

        return false;
      },
    );
  }

  String _valueString(int quantity, bool isUnit) {
    if (isUnit) {
      return quantity.toString();
    } else {
      if (quantity < 1000) {
        return '$quantity g';
      }
      return '${(quantity / 1000).toStringAsFixed(2)} kg'.replaceAll(
        '.',
        ',',
      );
    }
  }

  String _priceString(int price, int quantity, bool isUnit) {
    if (isUnit) {
      return (price * quantity).toCurrency();
    } else {
      return (price * quantity / 1000).round().toCurrency();
    }
  }
}
