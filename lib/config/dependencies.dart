import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

import '/data/repositories/shopping/shopping_repository.dart';
import '/data/services/database/database_service.dart';

Future<List<SingleChildWidget>> dependencies() async {
  final database = DatabaseService();
  await database.initialize('compras.db');

  return <SingleChildWidget>[
    ChangeNotifierProvider<ShoppingRepository>(
      create: (_) => ShoppingRepository(database),
    ),
    // Provider<IShoppingRepository>(
    //   create: (ctx) => ctx.read<ShoppingRepository>(),
    // ),
  ];
}
