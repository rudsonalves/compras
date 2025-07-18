import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/ui/view/search_category/search_category_view.dart';
import '/ui/view/search_category/search_category_view_model.dart';
import '/data/repositories/category/i_category_repository.dart';
import '/ui/view/scanner_barcode/scanner_barcode_view.dart';
import '/data/repositories/cart_items/i_cart_items_repository.dart';
import '/data/repositories/last_price/i_last_price_repository.dart';
import '/data/repositories/products/i_products_repository.dart';
import '/domain/user_cases/shopping_cart_user_case.dart';
import '/ui/view/cart_shopping/add_product_cart/add_product_cart_view.dart';
import '/ui/view/cart_shopping/add_product_cart/add_product_cart_view_model.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/ui/view/home/edit_shopping/edit_shopping_view.dart';
import '/ui/view/home/edit_shopping/edit_shopping_view_model.dart';
import '/ui/view/cart_shopping/cart_shopping_view.dart';
import '/ui/view/cart_shopping/cart_shopping_view_model.dart';
import '/data/repositories/shopping/i_shopping_repository.dart';
import '/routing/routes.dart';
import '/ui/view/home/home_view.dart';
import '/ui/view/home/home_view_model.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (ctx, _) => HomeView(
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
    ShellRoute(
      builder: (ctx, state, child) {
        final shopping = state.extra as ShoppingModel;

        final userCase = ShoppingCartUserCase(
          shopping: shopping,
          productsRepository: ctx.read<IProductsRepository>(),
          cartItemsRepository: ctx.read<ICartItemsRepository>(),
          lastPriceRepository: ctx.read<ILastPriceRepository>(),
          categoryRepository: ctx.read<ICategoryRepository>(),
        );

        return Provider<ShoppingCartUserCase>.value(
          value: userCase,
          builder: (ctx, state) => child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.shopping.path,
          name: Routes.shopping.name,
          builder: (ctx, state) {
            final shopping = state.extra as ShoppingModel;

            final userCase = ctx.read<ShoppingCartUserCase>();

            return CartShoppingView(
              shopping: shopping,
              viewModel: CartShoppingViewModel(userCase),
            );
          },
          routes: [
            GoRoute(
              path: Routes.addProductCart.path,
              name: Routes.addProductCart.name,
              builder: (ctx, state) {
                final shopping = state.extra as ShoppingModel;
                final userCase = ctx.read<ShoppingCartUserCase>();
                return AddProductCartView(
                  shopping: shopping,
                  viewModel: AddProductCartViewModel(userCase),
                );
              },
            ),
            GoRoute(
              path: Routes.searchCategory.path,
              name: Routes.searchCategory.name,
              builder: (ctx, state) {
                final userCase = ctx.read<ShoppingCartUserCase>();
                return SearchCategoryView(
                  viewModel: SearchCategoryViewModel(userCase),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.scanner.path,
      name: Routes.scanner.name,
      builder: (ctx, _) => QrCodeScannerView(),
    ),
  ],
);
