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
      builder: (context, state) => HomeView(
        viewModel: HomeViewModel(
          shoppingRepository: context.read<IShoppingRepository>(),
        ),
      ),
    ),
  ],
);
