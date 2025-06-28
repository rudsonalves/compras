import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/shopping/shopping_model.dart';
import '/ui/view/home/shopping/shopping_view_model.dart';

class ShoppingView extends StatefulWidget {
  final ShoppingModel shopping;
  final ShoppingViewModel viewModel;

  const ShoppingView({
    super.key,
    required this.viewModel,
    required this.shopping,
  });

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopping.name),
        elevation: 5,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Symbols.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
