import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:compras/data/repositories/shopping/i_shopping_repository.dart';
import 'package:compras/routing/routes.dart';
import 'package:compras/ui/view/home/home_view.dart';
import 'package:compras/ui/view/home/home_view_model.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: Routes.home.path,
      builder: (context, state) => HomeView(
        viewModel: HomeViewModel(
          shoppingRepository: context.read<IShoppingRepository>(),
        ),
      ),
    ),
  ],
);
