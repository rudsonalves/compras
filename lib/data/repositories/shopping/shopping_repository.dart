import 'dart:developer';

import '/data/repositories/shopping/i_shopping_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/services/database/tables/sql_tables.dart';
import '/domain/dto/shopping/shopping_dto.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/result.dart';

class ShoppingRepository extends IShoppingRepository {
  final DatabaseService _dbService;

  ShoppingRepository(this._dbService);

  final Map<String, ShoppingModel> _shopping = {};
  bool _isInitialized = false;

  @override
  List<ShoppingModel> get shoppingList =>
      List<ShoppingModel>.unmodifiable(_shopping.values);

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    final result = await fetchAll();

    switch (result) {
      case Success():
        log('Shoppings initialized');
        return Result.success(null);

      case Failure(:final error):
        log('Error fetching shoppings: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ShoppingModel>> insert(ShoppingDto dto) async {
    final result = await _dbService.insert<ShoppingDto>(
      Tables.shopping,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final shopping = ShoppingModel.fromDto(id, dto);
        _shopping[shopping.id] = shopping;
        notifyListeners();
        return Result.success(shopping);

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

    final result = await _dbService.fetchById<ShoppingModel>(
      Tables.shopping,
      id: id,
      fromMap: ShoppingModel.fromJson,
    );

    switch (result) {
      case Success(:final value):
        _shopping[id] = value;
        notifyListeners();
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching shopping: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<List<ShoppingModel>>> fetchAll({
    int limit = 20,
    int offset = 0,
  }) async {
    if (offset == 0) {
      _shopping.clear();
    }

    final result = await _dbService.fetchAll<ShoppingModel>(
      Tables.shopping,
      fromMap: ShoppingModel.fromJson,
      limit: limit,
      offset: 0,
    );

    switch (result) {
      case Success(:final value):
        for (var shopping in value) {
          _shopping[shopping.id] = shopping;
        }
        notifyListeners();
        return Result.success(value);

      case Failure(:final error):
        log('Error fetching all shoppings: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ShoppingModel>> update(ShoppingModel shopping) async {
    final result = await _dbService.update<ShoppingModel>(
      Tables.shopping,
      map: shopping.toJson(),
    );

    switch (result) {
      case Success():
        _shopping[shopping.id] = shopping;
        notifyListeners();
        return Result.success(shopping);

      case Failure(:final error):
        log('Error updating shopping: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    final result = await _dbService.delete<ShoppingModel>(
      Tables.shopping,
      id: id,
    );

    switch (result) {
      case Success():
        _shopping.remove(id);
        notifyListeners();
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting shopping: $error');
        return Result.failure(error);
    }
  }
}
