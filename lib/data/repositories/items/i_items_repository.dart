import '/domain/models/item/item_model.dart';
import '/utils/result.dart';

abstract class IItemsRepository {
  List<ItemModel> get itemsList;

  int totalPrice();

  Future<Result<void>> initialize(String shoppingId);

  Future<Result<ItemModel>> insert(ItemModel item);

  Future<Result<void>> fetchAll(String shoppingId);

  Future<Result<ItemModel>> fetch(String productId);

  Future<Result<ItemModel>> update(ItemModel item);

  Future<Result<void>> delete(String productId);
}
