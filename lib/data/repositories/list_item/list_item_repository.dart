import 'dart:developer';

import '/data/services/database/tables/sql_tables.dart';
import '/domain/dto/list_item/list_item_dto.dart';
import '/utils/result.dart';
import '/data/services/database/database_service.dart';
import '/domain/models/list_item/list_item_model.dart';
import '/data/repositories/list_item/i_list_item_repository.dart';

import 'package:flutter/material.dart';

class ListItemRepository extends ChangeNotifier implements IListItemRepository {
  final DatabaseService _databaseService;

  ListItemRepository(this._databaseService);

  final Map<String, ListItemModel> _listItems = {};
  String? _shoppingId;

  List<ListItemModel> get listItems => List.unmodifiable(_listItems.values);

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
  Future<Result<ListItemModel>> insert(ListItemDto dto) async {
    if (dto.shoppingId != _shoppingId) {
      return Result.failure(Exception('Item does not belong to this shopping'));
    }

    final result = await _databaseService.insert<ListItemModel>(
      Tables.listItems,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final listItem = ListItemModel.fromDto(id, dto);
        _listItems[listItem.id] = listItem;
        notifyListeners();
        return Result.success(listItem);

      case Failure(:final error):
        log('Error inserting item: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> fetchAll(String shoppingId) async {
    _listItems.clear();
    _shoppingId = shoppingId;

    final result = await _databaseService.fetchAll<ListItemModel>(
      Tables.listItems,
      filter: {ListItemsColumns.shoppingId: shoppingId},
      fromMap: ListItemModel.fromJson,
    );

    switch (result) {
      case Success(value: final items):
        for (var item in items) {
          _listItems[item.id] = item;
        }
        notifyListeners();
        return Result.success(null);

      case Failure(:final error):
        log('Error fetching items: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<ListItemModel>> update(ListItemModel item) async {
    if (item.shoppingId != _shoppingId) {
      return Result.failure(Exception('Item does not belong to this shopping'));
    }

    final result = await _databaseService.update<ListItemModel>(
      Tables.listItems,
      map: item.toJson(),
    );

    switch (result) {
      case Success():
        _listItems[item.id] = item;
        notifyListeners();
        return Result.success(item);

      case Failure(:final error):
        log('Error updating item: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    final result = await _databaseService.deleteWhere<ListItemModel>(
      Tables.listItems,
      filter: {ListItemsColumns.id: id},
    );

    switch (result) {
      case Success():
        _listItems.remove(id);
        notifyListeners();
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting item: $error');
        return Result.failure(error);
    }
  }
}
