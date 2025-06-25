import 'package:compras/domain/models/product_model.dart';
import 'package:compras/utils/result.dart';

abstract class IProductsRepository {
  List<ProductModel> get productList;

  Future<Result<void>> initialize(String shoppingId);

  Future<Result<ProductModel>> insert(ProductModel product);

  Future<Result<List<ProductModel>>> fetchAll(String shoppingId);

  Future<Result<ProductModel>> fetch(String id);

  Future<Result<ProductModel>> update(ProductModel product);

  Future<Result<void>> delete(String id);
}
