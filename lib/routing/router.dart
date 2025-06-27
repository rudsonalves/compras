import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/data/repositories/shopping/shopping_repository.dart';
import '/ui/view/new_shoppint/new_shopping.dart';
import '/ui/view/new_shoppint/new_shopping_view_model.dart';
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
          shoppingRepository: ctx.read<ShoppingRepository>(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.newShopping.path,
      name: Routes.newShopping.name,
      builder: (ctx, state) => NewShopping(
        viewModel: NewShoppingViewModel(
          shoppingRepository: ctx.read<ShoppingRepository>(),
        ),
      ),
    ),
  ],
);
