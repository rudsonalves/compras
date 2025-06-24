import 'package:compras/domain/models/shopping_model.dart';
import 'package:compras/utils/result.dart';

abstract class IShoppingRepository {
  List<ShoppingModel> get shoppingList;

  Future<Result<void>> initialize();

  Future<Result<ShoppingModel>> insert(ShoppingModel shopping);

  Future<Result<List<ShoppingModel>>> fetchAll({
    int limit = 10,
    int offset = 0,
  });

  Future<Result<ShoppingModel>> fetch(String id);

  Future<Result<ShoppingModel>> update(ShoppingModel shopping);

  Future<Result<void>> delete(String id);
}
