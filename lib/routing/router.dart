import 'package:compras/domain/models/shopping/shopping_model.dart';
import 'package:compras/ui/view/home/edit_shopping/edit_shopping_view.dart';
import 'package:compras/ui/view/home/edit_shopping/edit_shopping_view_model.dart';
import 'package:compras/ui/view/home/shopping/shopping_view.dart';
import 'package:compras/ui/view/home/shopping/shopping_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      builder: (ctx, state) => EditShoppingView(
        viewModel: EditShoppingViewModel(
          shoppingRepository: ctx.read<IShoppingRepository>(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.shopping.path,
      name: Routes.shopping.name,
      builder: (ctx, state) {
        final shopping = state.extra as ShoppingModel;

        return ShoppingView(
          shopping: shopping,
          viewModel: ShoppingViewModel(
            //   shoppingRepository: ctx.read<IShoppingRepository>(),
          ),
        );
      },
    ),
  ],
);
