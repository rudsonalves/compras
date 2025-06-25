import 'dart:developer';

import 'package:compras/data/repositories/products/i_products_repository.dart';
import 'package:compras/data/services/database/database_service.dart';
import 'package:compras/data/services/database/tables/sql_tables.dart';
import 'package:compras/domain/models/product_model.dart';
import 'package:compras/utils/result.dart';

class ProductsRepository implements IProductsRepository {
  final DatabaseService _databaseService;

  ProductsRepository(DatabaseService databaseService)
    : _databaseService = databaseService;

  final Map<String, ProductModel> _products = {};
  String? _shoppingId;

  @override
  List<ProductModel> get productList =>
      List<ProductModel>.unmodifiable(_products.values);

  @override
  Future<Result<void>> initialize(String shoppingId) async {
    if (_shoppingId != null || _shoppingId == shoppingId) {
      return Result.success(null);
    }

    final result = await fetchAll(shoppingId);

    switch (result) {
      case Success():
        return Result.success(null);

      case Failure(:final error):
        log('Error initializing products: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ProductModel>> insert(ProductModel product) async {
    if (product.id != null) {
      return update(product);
    }

    final result = await _databaseService.insert<ProductModel>(
      Tables.products,
      product.toMap(),
    );

    switch (result) {
      case Success(:final value):
        final newProduct = product.copyWith(id: value);
        _products[newProduct.id!] = newProduct;
        return Result.success(newProduct);

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
      fromMap: ProductModel.fromMap,
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
  Future<Result<List<ProductModel>>> fetchAll(String shoppingId) async {
    _products.clear();

    _shoppingId = shoppingId;

    final result = await _databaseService.fetchAll<ProductModel>(
      Tables.products,
      filter: {'shopping_id': shoppingId},
      fromMap: ProductModel.fromMap,
    );

    switch (result) {
      case Success(:final value):
        for (var product in value) {
          _products[product.id!] = product;
        }
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching products: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ProductModel>> update(ProductModel product) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
