import 'package:compras/data/repositories/shopping/i_shopping_repository.dart';
import 'package:compras/data/repositories/shopping/shopping_repository.dart';
import 'package:compras/data/services/database/database_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

Future<List<SingleChildWidget>> dependencies() async {
  final database = DatabaseService();
  await database.initialize('compras.db');

  return <SingleChildWidget>[
    Provider<IShoppingRepository>(
      create: (ctx) => ShoppingRepository(database),
    ),
  ];
}
