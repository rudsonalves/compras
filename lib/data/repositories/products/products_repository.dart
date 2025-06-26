import 'dart:developer';

import '/data/repositories/products/i_products_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/services/database/tables/sql_tables.dart';
import '/domain/dto/product/product_dto.dart';
import '/domain/models/product/product_model.dart';
import '/utils/result.dart';

class ProductsRepository implements IProductsRepository {
  final DatabaseService _databaseService;

  ProductsRepository(DatabaseService databaseService)
    : _databaseService = databaseService;

  final Map<String, ProductModel> _products = {};
  bool _isInitialized = false;

  @override
  List<ProductModel> get productList =>
      List<ProductModel>.unmodifiable(_products.values);

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    return Result.success(null);
  }

  @override
  Future<Result<ProductModel>> insert(ProductDto dto) async {
    final result = await _databaseService.insert<ProductModel>(
      Tables.products,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final product = ProductModel.fromDto(id, dto);
        _products[product.id] = product;
        return Result.success(product);

      case Failure(:final error):
        log('Error inserting product: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ProductModel>> fetch(String id) async {
    if (_products.containsKey(id)) {
      return Result.success(_products[id]!);
    }

    final result = await _databaseService.fetch<ProductModel>(
      Tables.products,
      id: id,
      fromMap: ProductModel.fromJson,
    );

    switch (result) {
      case Success(:final value):
        _products[id] = value;
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching product: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<List<ProductModel>>> fetchAll({
    int limit = 9999,
    int offset = 0,
  }) async {
    _products.clear();

    final result = await _databaseService.fetchAll<ProductModel>(
      Tables.products,
      fromMap: ProductModel.fromJson,
      limit: limit,
      offset: offset,
    );

    switch (result) {
      case Success(:final value):
        for (var product in value) {
          _products[product.id] = product;
        }
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching products: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ProductModel>> update(ProductModel product) async {
    final result = await _databaseService.update<ProductModel>(
      Tables.products,
      map: product.toJson(),
    );

    switch (result) {
      case Success():
        _products[product.id] = product;
        return Result.success(product);

      case Failure(:final error):
        log('Error updating product: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    final result = await _databaseService.delete<ProductModel>(
      Tables.products,
      id: id,
    );

    switch (result) {
      case Success():
        _products.remove(id);
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting product: $error');
        return Result.failure(error);
    }
  }
}
