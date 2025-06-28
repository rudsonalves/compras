import 'dart:developer';

import 'package:compras/utils/result.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final Database _database;

  DatabaseService(this._database);

  final uuid = const Uuid();

  String generateUid() => uuid.v4();

  Future<Result<T>> fetchById<T>(
    String table, {
    required String id,
    required T Function(Map<String, dynamic>) fromMap,
    bool forceRemote = false,
  }) async {
    try {
      final List<Map<String, dynamic>> results = await _database.query(
        table,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (results.isEmpty) throw Exception('No record found with id: $id');

      return Result.success(fromMap(results.first));
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.fetch: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<T>> fetchByFilter<T>(
    String table, {
    required T Function(Map<String, dynamic>) fromMap,
    required Map<String, dynamic> filter,
    String? orderBy,
    bool forceRemote = false,
  }) async {
    try {
      final whereFilter = filter.keys.map((key) => '$key = ?').join(' AND ');
      final whereArgs = filter.values.toList();

      final List<Map<String, dynamic>> results = await _database.query(
        table,
        where: whereFilter,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );

      if (results.isEmpty) {
        throw Exception('No record found with filter: $filter');
      }

      return Result.success(fromMap(results.first));
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.fetch: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<List<T>>> fetchAll<T>(
    String table, {
    Map<String, dynamic>? filter,
    required T Function(Map<String, dynamic>) fromMap,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    try {
      final sortBy = orderBy ?? 'created_at ASC';

      late final List<Map<String, dynamic>> results;
      if (filter != null) {
        final where = filter.keys.map((key) => '$key = ?').join(' AND ');
        final whereArgs = filter.values.toList();
        results = await _database.query(
          table,
          where: where,
          whereArgs: whereArgs,
          orderBy: sortBy,
          limit: limit,
          offset: offset,
        );
      } else {
        results = await _database.query(table);
      }

      final List<T> items = results.map(fromMap).toList();
      return Result.success(items);
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.fetchAll: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<String>> insert<T>(
    String table,
    Map<String, dynamic> map,
  ) async {
    try {
      if (map['id'] != null) {
        throw Exception('ID should not be provided for insert');
      }

      final id = generateUid();
      final newData = Map<String, dynamic>.from(map);
      newData['id'] = id;

      await _database.insert(table, newData);
      return Result.success(id);
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.insert: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<void>> set<T>(
    String table,
    Map<String, dynamic> map,
  ) async {
    try {
      if (map['id'] == null) {
        throw Exception('ID should be provided for set');
      }

      await _database.insert(
        table,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return Result.success(null);
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.insert: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<void>> update<T>(
    String table, {
    required Map<String, dynamic> map,
  }) async {
    try {
      final id = map['id'] as String?;
      if (id == null) throw Exception('ID must not be null for update');

      final int count = await _database.update(
        table,
        map,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) throw Exception('No record found with id: $id');

      return Result.success(null);
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.update: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<void>> updateWhere<T>(
    String table, {
    required Map<String, dynamic> map,
    required Map<String, dynamic> filter,
  }) async {
    try {
      final filterWhere = filter.keys.map((key) => '$key = ?').join(' AND ');
      final filterArgs = filter.values.toList();

      final int count = await _database.update(
        table,
        map,
        where: filterWhere,
        whereArgs: filterArgs,
      );

      if (count == 0) throw Exception('No record found with filter: $filter');

      return Result.success(null);
    } on Exception catch (err, stack) {
      log(
        'DatabeseService.update: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<void>> delete<T>(
    String table, {
    required String id,
  }) async {
    try {
      final int count = await _database.delete(
        table,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) throw Exception('No record found with id: $id');

      return Result.success(null);
    } on Exception catch (err, stack) {
      log(
        'DatabaseService.delete: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }

  Future<Result<void>> deleteWhere<T>(
    String table, {
    required Map<String, dynamic> filter,
  }) async {
    try {
      final filterWhere = filter.keys.map((key) => '$key = ?').join(' AND ');
      final filterArgs = filter.values.toList();

      final int count = await _database.delete(
        table,
        where: filterWhere,
        whereArgs: filterArgs,
      );

      if (count == 0) throw Exception('No record found with filter: $filter');

      return Result.success(null);
    } on Exception catch (err, stack) {
      log(
        'DatabaseService.delete: $err',
        error: err,
        stackTrace: stack,
      );
      return Result.failure(err);
    }
  }
}
