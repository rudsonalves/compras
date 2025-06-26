import 'package:compras/ui/view/new_shoppint/new_shopping.dart';
import 'package:compras/ui/view/new_shoppint/new_shopping_view_model.dart';
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
      builder: (context, state) => HomeView(
        viewModel: HomeViewModel(
          shoppingRepository: context.read<IShoppingRepository>(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.newShopping.path,
      name: Routes.newShopping.name,
      builder: (context, state) => NewShopping(
        viewModel: NewShoppingViewModel(
          shoppingRepository: context.read<IShoppingRepository>(),
        ),
      ),
    ),
  ],
);
