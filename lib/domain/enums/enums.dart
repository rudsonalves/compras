import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum ShoppingType {
  supermarket('Mercado', Symbols.local_grocery_store_rounded),
  pharmacy('Farmácia', Symbols.local_pharmacy_rounded),
  groceryStore('Mercearia', Symbols.local_grocery_store_rounded),
  other('Outro', Symbols.other_houses_rounded);

  final String label;
  final IconData iconData;
  const ShoppingType(this.label, this.iconData);
}

enum SaleBy {
  unit('Unidade'),
  weight('Peso');

  final String label;
  const SaleBy(this.label);
}

enum ThreeState {
  yes,
  no,
  indeterminate,
}
