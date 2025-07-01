import 'package:compras/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/shopping/shopping_model.dart';
import 'cart_shopping_view_model.dart';

class CartShoppingView extends StatefulWidget {
  final ShoppingModel shopping;
  final CartShoppingViewModel viewModel;

  const CartShoppingView({
    super.key,
    required this.viewModel,
    required this.shopping,
  });

  @override
  State<CartShoppingView> createState() => _CartShoppingViewState();
}

class _CartShoppingViewState extends State<CartShoppingView> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addProductCart,
        child: Icon(Symbols.add_rounded),
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel.cartNotifier,
        builder: (context, _) {
          return Center(
            child: Text(widget.shopping.name),
          );
        },
      ),
    );
  }

  void _addProductCart() {
    context.push(Routes.addProductCart.path);
  }
}
