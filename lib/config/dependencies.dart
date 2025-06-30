import 'package:compras/data/repositories/shopping/i_shopping_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

import '../data/repositories/items/i_cart_items_repository.dart';
import '../data/repositories/items/cart_items_repository.dart';
import '/data/repositories/last_price/i_last_price_repository.dart';
import '/data/repositories/last_price/last_price_repository.dart';
import '/data/repositories/products/i_products_repository.dart';
import '/data/repositories/products/products_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/repositories/shopping/shopping_repository.dart';
import '/data/services/database/database_manager.dart';

Future<List<SingleChildWidget>> dependencies() async {
  final dbManager = DatabaseManager();
  final dbService = DatabaseService(
    await dbManager.initialize('compras.db'),
  );

  return <SingleChildWidget>[
    Provider<DatabaseManager>(
      create: (_) => dbManager,
      dispose: (_, manager) => manager.close(),
    ),
    Provider<DatabaseService>(create: (_) => dbService),
    ChangeNotifierProvider<IShoppingRepository>(
      create: (_) => ShoppingRepository(dbService),
    ),
    Provider<IProductsRepository>(
      create: (_) => ProductsRepository(dbService),
    ),
    Provider<ICartItemsRepository>(
      create: (_) => CartItemsRepository(dbService),
    ),
    Provider<ILastPriceRepository>(
      create: (_) => LastPriceRepository(dbService),
    ),
  ];
}
