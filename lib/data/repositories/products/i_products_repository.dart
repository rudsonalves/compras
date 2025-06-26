import '/domain/dto/product/product_dto.dart';
import '/domain/models/product/product_model.dart';
import '/utils/result.dart';

abstract class IProductsRepository {
  List<ProductModel> get productList;

  Future<Result<void>> initialize();

  Future<Result<ProductModel>> insert(ProductDto dto);

  Future<Result<List<ProductModel>>> fetchAll();

  Future<Result<ProductModel>> fetch(String id);

  Future<Result<ProductModel>> update(ProductModel product);

  Future<Result<void>> delete(String id);
}
