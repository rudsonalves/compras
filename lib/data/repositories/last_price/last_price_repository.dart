import 'dart:developer';

import '/data/services/database/tables/sql_tables.dart';
import '/domain/dto/last_price/last_price_dto.dart';
import '/data/repositories/last_price/i_last_price_repository.dart';
import '/data/services/database/database_service.dart';
import '/domain/models/last_price/last_price_model.dart';
import '/utils/result.dart';

class LastPriceRepository implements ILastPriceRepository {
  final DatabaseService _dbService;

  LastPriceRepository(this._dbService);

  final Map<String, List<LastPriceModel>> _lastPriceMap = {};
  bool _isInitialized = false;

  @override
  List<LastPriceModel> get lastPriceList =>
      List.unmodifiable(_lastPriceMap.values);

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    return Result.success(null);
  }

  @override
  Future<Result<LastPriceModel>> insert(LastPriceDto dto) async {
    final result = await _dbService.insert<LastPriceDto>(
      Tables.lastPrice,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final lastPrice = LastPriceModel.fromDto(id, dto);
        if (!_lastPriceMap.containsKey(lastPrice.productId)) {
          _lastPriceMap[lastPrice.productId] = <LastPriceModel>[];
        }
        _lastPriceMap[lastPrice.id]!.add(lastPrice);
        return Result.success(lastPrice);

      case Failure(:final error):
        log('Error inserting last price: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<LastPriceModel>> fetch(String productId) async {
    if (_lastPriceMap.containsKey(productId)) {
      return Result.success(_lastPriceMap[productId]!.last);
    }

    final result = await _dbService.fetchAll<LastPriceModel>(
      Tables.lastPrice,
      filter: {LastPriceColumns.productId: productId},
      fromMap: LastPriceModel.fromJson,
      orderBy: LastPriceColumns.createdAt,
      limit: 5,
    );

    switch (result) {
      case Success(value: final lastPriceList):
        for (var lastPrice in lastPriceList.reversed) {
          if (!_lastPriceMap.containsKey(lastPrice.productId)) {
            _lastPriceMap[lastPrice.productId] = <LastPriceModel>[];
          }
          _lastPriceMap[lastPrice.productId]!.add(lastPrice);
        }
        return Result.success(lastPriceList.last);

      case Failure(:final error):
        log('Error fetching last price: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<LastPriceModel>> update(LastPriceModel lastPrice) async {
    if (!_lastPriceMap.containsKey(lastPrice.productId)) {
      return Result.failure(Exception('Last price does not exist'));
    }

    final result = await _dbService.update<LastPriceModel>(
      Tables.lastPrice,
      map: lastPrice.toJson(),
    );

    switch (result) {
      case Success():
        final index = _findIndex(lastPrice);
        if (index == -1) {
          return Result.failure(Exception('Last price does not exist'));
        }
        _lastPriceMap[lastPrice.productId]![index] = lastPrice;
        return Result.success(lastPrice);

      case Failure(:final error):
        log('Error updating last price: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> delete(LastPriceModel lastPrice) async {
    if (!_lastPriceMap.containsKey(lastPrice.productId)) {
      return Result.failure(Exception('Last price does not exist'));
    }

    final result = await _dbService.delete<LastPriceModel>(
      Tables.lastPrice,
      id: lastPrice.id,
    );

    switch (result) {
      case Success():
        final index = _findIndex(
          _lastPriceMap[lastPrice.productId]!.firstWhere(
            (item) => item.id == lastPrice.id,
          ),
        );
        if (index == -1) {
          return Result.failure(Exception('Last price does not exist'));
        }
        _lastPriceMap[lastPrice.productId]!.removeAt(index);
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting last price: $error');
        return Result.failure(error);
    }
  }

  int _findIndex(LastPriceModel lastPrice) {
    return _lastPriceMap[lastPrice.productId]!.indexWhere(
      (item) => item.id == lastPrice.id,
    );
  }
}
