import 'package:compras/data/repositories/items/i_cart_items_repository.dart';
import 'package:compras/data/repositories/last_price/i_last_price_repository.dart';
import 'package:compras/data/repositories/products/i_products_repository.dart';
import 'package:compras/domain/user_cases/shopping_cart_user_case.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/domain/models/shopping/shopping_model.dart';
import '/ui/view/home/edit_shopping/edit_shopping_view.dart';
import '/ui/view/home/edit_shopping/edit_shopping_view_model.dart';
import '/ui/view/home/shopping/shopping_view.dart';
import '/ui/view/home/shopping/shopping_view_model.dart';
import '/data/repositories/shopping/i_shopping_repository.dart';
import '/routing/routes.dart';
import '/ui/view/home/home_view.dart';
import '/ui/view/home/home_view_model.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (ctx, state) => HomeView(
        viewModel: HomeViewModel(
          shoppingRepository: ctx.read<IShoppingRepository>(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.editShopping.path,
      name: Routes.editShopping.name,
      builder: (ctx, state) {
        final shopping = state.extra as ShoppingModel?;
        return EditShoppingView(
          shopping: shopping,
          viewModel: EditShoppingViewModel(
            shoppingRepository: ctx.read<IShoppingRepository>(),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.shopping.path,
      name: Routes.shopping.name,
      builder: (ctx, state) {
        final shopping = state.extra as ShoppingModel;
        return ShoppingView(
          shopping: shopping,
          viewModel: ShoppingViewModel(
            ShoppingCartUserCase(
              shopping: shopping,
              productsRepository: ctx.read<IProductsRepository>(),
              cartItemsRepository: ctx.read<ICartItemsRepository>(),
              lastPriceRepository: ctx.read<ILastPriceRepository>(),
            ),
          ),
        );
      },
    ),
  ],
);
