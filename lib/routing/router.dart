import 'package:compras/data/repositories/list_item/i_list_item_repository.dart';
import 'package:compras/domain/user_cases/add_item_list_user_case.dart';
import 'package:compras/ui/view/cart_shopping/add_item_list/add_item_list_view.dart';
import 'package:compras/ui/view/cart_shopping/add_item_list/add_item_list_view_model.dart';
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
import '../ui/view/cart_shopping/add_item_cart/add_item_cart_view.dart';
import '../ui/view/cart_shopping/add_item_cart/add_item_cart_view_model.dart';
import '/domain/models/shopping/shopping_model.dart';
import '../ui/view/home/add_shopping/add_shopping_view.dart';
import '../ui/view/home/add_shopping/add_shopping_view_model.dart';
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
        return AddShoppingView(
          shopping: shopping,
          viewModel: AddShoppingViewModel(
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
          listItemRepository: ctx.read<IListItemRepository>(),
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
                return AddItemCartView(
                  shopping: shopping,
                  viewModel: AddItemCartViewModel(userCase),
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
    GoRoute(
      path: Routes.addItemList.path,
      name: Routes.addItemList.name,
      builder: (ctx, state) {
        final shoppingId = state.extra as String?;

        return AddItemListView(
          shoppingId: shoppingId!,
          viewModel: AddItemListViewModel(
            AddItemListUserCase(
              listItemRepository: ctx.read<IListItemRepository>(),
              productsRepository: ctx.read<IProductsRepository>(),
            ),
          ),
        );
      },
    ),
  ],
);
