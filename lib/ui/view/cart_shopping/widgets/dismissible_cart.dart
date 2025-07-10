import 'package:compras/domain/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/item/item_model.dart';
import '/ui/core/themes/fonts.dart';
import '/ui/core/ui/dismissibles/dismissible_container.dart';
import '/utils/extensions/int_extensions.dart';

class DismissibleCart extends StatelessWidget {
  final ItemModel item;
  final void Function(ItemModel item) editItem;
  final Future<bool> Function(ItemModel item) deleteItem;

  const DismissibleCart({
    super.key,
    required this.item,
    required this.editItem,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    final fontStyle = AppFontsStyle.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    late final int price;
    late final String quantity;
    if (item.saleBy == SaleBy.unit) {
      price = item.unitPrince * item.quantity;
      quantity = item.quantity.toString();
    } else {
      price = (item.unitPrince * item.quantity / 1000).round();
      quantity = '${(item.quantity / 1000).toStringAsFixed(3)} kg';
    }

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
        color: colorScheme.primaryContainer,
        child: ListTile(
          title: Text(item.name),
          subtitle: Text('Quantity: $quantity'),
          trailing: Text(
            price.toCurrencyWithSymbol(),
            style: fontStyle.bodyLargeTextStyle,
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
}
