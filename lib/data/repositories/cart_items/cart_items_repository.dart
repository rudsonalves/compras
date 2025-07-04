import 'dart:developer';

import 'package:flutter/material.dart';

import 'i_cart_items_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/services/database/tables/sql_tables.dart';
import '/domain/models/item/item_model.dart';
import '/utils/result.dart';

class CartItemsRepository extends ChangeNotifier
    implements ICartItemsRepository {
  final DatabaseService _dbService;

  CartItemsRepository(this._dbService);

  final Map<String, ItemModel> _items = {}; // indexed by productId
  String _shoppingId = '';

  @override
  List<ItemModel> get itemsList => List.unmodifiable(_items.values);

  @override
  int totalPrice() => _items.values.fold(
    0,
    (total, item) => total + item.unitPrince * item.quantity,
  );

  @override
  Future<Result<void>> initialize(String shoppingId) async {
    if (_shoppingId == shoppingId) return Result.success(null);
    _shoppingId = shoppingId;

    final result = await fetchAll(shoppingId);

    switch (result) {
      case Success():
        log('Items initialized');
        return Result.success(null);

      case Failure(:final error):
        log('Error fetching items: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ItemModel>> insert(ItemModel item) async {
    if (item.shoppingId != _shoppingId) {
      return Result.failure(Exception('Item does not belong to this shopping'));
    }

    final result = await _dbService.set(
      Tables.items,
      item.toJson(),
    );

    switch (result) {
      case Success():
        _items[item.productId] = item;
        notifyListeners();
        return Result.success(item);

      case Failure(:final error):
        log('Error inserting item: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ItemModel>> fetch(String productId) async {
    if (_items.containsKey(productId)) {
      return Result.success(_items[productId]!);
    }

    final result = await _dbService.fetchByFilter<ItemModel>(
      Tables.items,
      filter: {
        ItemColumns.shoppingId: _shoppingId,
        ItemColumns.productId: productId,
      },
      fromMap: ItemModel.fromJson,
    );

    switch (result) {
      case Success(value: final item):
        _items[productId] = item;
        notifyListeners();
        return Result.success(item);

      case Failure(:final error):
        log('Error fetching item: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> fetchAll(String shoppingId) async {
    _items.clear();

    final result = await _dbService.fetchAll<ItemModel>(
      Tables.items,
      filter: {ItemColumns.shoppingId: shoppingId},
      fromMap: ItemModel.fromJson,
    );

    switch (result) {
      case Success(value: final item):
        for (var item in item) {
          _items[item.productId] = item;
        }
        notifyListeners();
        return Result.success(null);

      case Failure(:final error):
        log('Error fetching items: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ItemModel>> update(ItemModel item) async {
    if (item.shoppingId != _shoppingId) {
      return Result.failure(Exception('Item does not belong to this shopping'));
    }

    final result = await _dbService.updateWhere<ItemModel>(
      Tables.items,
      map: item.toJson(),
      filter: {
        ItemColumns.shoppingId: item.shoppingId,
        ItemColumns.productId: item.productId,
      },
    );

    switch (result) {
      case Success():
        _items[item.productId] = item;
        notifyListeners();
        return Result.success(item);

      case Failure(:final error):
        log('Error updating item: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(String productId) async {
    final result = await _dbService.deleteWhere<ItemModel>(
      Tables.items,
      filter: {
        ItemColumns.shoppingId: _shoppingId,
        ItemColumns.productId: productId,
      },
    );

    switch (result) {
      case Success():
        _items.remove(productId);
        notifyListeners();
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting item: $error');
        return Result.failure(error);
    }
  }
}
