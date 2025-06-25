import 'dart:developer';

import 'package:compras/data/repositories/shopping/i_shopping_repository.dart';
import 'package:compras/data/services/database/database_service.dart';
import 'package:compras/data/services/database/tables/sql_tables.dart';
import 'package:compras/domain/models/shopping_model.dart';
import 'package:compras/utils/result.dart';

class ShoppingRepository implements IShoppingRepository {
  final DatabaseService _database;

  ShoppingRepository(this._database);

  final Map<String, ShoppingModel> _shopping = {};
  bool _isInitialized = false;

  @override
  List<ShoppingModel> get shoppingList =>
      List<ShoppingModel>.unmodifiable(_shopping.values);

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    await fetchAll();

    return Result.success(null);
  }

  @override
  Future<Result<ShoppingModel>> insert(ShoppingModel shopping) async {
    if (shopping.id != null) {
      return update(shopping);
    }

    final result = await _database.insert<ShoppingModel>(
      Tables.shopping,
      shopping.toMap(),
    );

    switch (result) {
      case Success(:final value):
        final newShopping = shopping.copyWith(id: value);
        _shopping[newShopping.id!] = newShopping;
        return Result.success(newShopping);

      case Failure(:final error):
        log('Error inserting shopping: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ShoppingModel>> fetch(String id) async {
    if (_shopping.containsKey(id)) {
      return Result.success(_shopping[id]!);
    }

    final result = await _database.fetch<ShoppingModel>(
      Tables.shopping,
      id: id,
      fromMap: ShoppingModel.fromMap,
    );

    switch (result) {
      case Success(:final value):
        _shopping[id] = value;
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching shopping: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<List<ShoppingModel>>> fetchAll({
    int limit = 9999,
    int offset = 0,
  }) async {
    if (offset == 0) {
      _shopping.clear();
    }

    final result = await _database.fetchAll<ShoppingModel>(
      Tables.shopping,
      fromMap: ShoppingModel.fromMap,
      limit: limit,
      offset: 0,
    );

    switch (result) {
      case Success(:final value):
        for (var shopping in value) {
          _shopping[shopping.id!] = shopping;
        }
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching all shoppings: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ShoppingModel>> update(ShoppingModel shopping) async {
    if (shopping.id == null) {
      return insert(shopping);
    }

    final result = await _database.update<ShoppingModel>(
      Tables.shopping,
      map: shopping.toMap(),
    );

    switch (result) {
      case Success():
        _shopping[shopping.id!] = shopping;
        return Result.success(shopping);

      case Failure(:final error):
        log('Error updating shopping: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    final result = await _database.delete<ShoppingModel>(
      Tables.shopping,
      id: id,
    );

    switch (result) {
      case Success():
        _shopping.remove(id);
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting shopping: $error');
        return Result.failure(error);
    }
  }
}
