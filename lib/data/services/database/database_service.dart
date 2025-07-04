import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '/data/services/exceptions/exceptions.dart';
import '/utils/result.dart';

class DatabaseService {
  final Database _database;

  DatabaseService(this._database);

  final uuid = const Uuid();

  String generateUid() => uuid.v4();

  /// Fetches a single record by its unique identifier from the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [id] is the unique identifier of the record to fetch.
  /// [fromMap] is a function that converts a map of key-value pairs into an
  /// instance of type [T].
  /// [forceRemote] is a boolean flag that can be used to force fetching from a
  /// remote source if applicable.
  ///
  /// Returns a [Result] containing an instance of type [T] if a matching
  /// record is found.
  /// Throws an exception if no record matches the given id.
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

      if (results.isEmpty) throw RecordNotFoundException('with id $id');

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

  /// Fetches a single record from the specified table that matches the given
  /// filter.
  ///
  /// [table] is the name of the database table to query.
  /// [fromMap] is a function that converts a map of key-value pairs into an
  /// instance of type [T].
  /// [filter] is a map representing the filter conditions where the keys are
  /// column names and values are the values to match.
  /// [orderBy] specifies the column(s) to order the results by, if needed.
  /// [forceRemote] is a boolean flag that can be used to force fetching from a
  /// remote source if applicable.
  ///
  /// Returns a [Result] containing an instance of type [T] if a matching record
  /// is found.
  /// Throws an exception if no record matches the filter conditions.
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
        throw RecordNotFoundException('with filter $filter');
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

  /// Fetches a list of records from the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [filter] is an optional map of key-value pairs that are used to filter the
  /// results.
  /// [fromMap] is a function that converts a map of key-value pairs into an
  /// instance of type [T].
  /// [orderBy] is an optional string that specifies the column(s) to order the
  /// results by.
  /// [limit] and [offset] are optional parameters that can be used to paginate
  /// the results.
  ///
  /// Returns a [Result] containing a list of instances of type [T] if the query
  /// is successful.
  /// Throws an exception if an error occurs while performing the query.
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

  /// Inserts a record into the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [map] is a map of key-value pairs that are used to insert the record.
  /// The map must not contain an 'id' key.
  ///
  /// Returns a [Result] containing the ID of the newly inserted record if the
  /// query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

  /// Inserts or updates a record in the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [map] is a map of key-value pairs that are used to insert the record.
  /// The map must contain an 'id' key.
  ///
  /// If the record already exists in the table, it is updated.
  /// If the record does not exist in the table, it is inserted.
  ///
  /// Returns a [Result] containing null if the query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

  /// Updates a single record in the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [map] is a map of key-value pairs that are used to update the record.
  /// The map must contain an 'id' key.
  ///
  /// If the record does not exist in the table, an exception is thrown.
  ///
  /// Returns a [Result] containing null if the query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

      if (count == 0) throw RecordNotFoundException('with id $id');

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

  /// Updates multiple records in the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [map] is a map of key-value pairs that are used to update the records.
  /// [filter] is a map representing the filter conditions where the keys are
  /// column names and values are the values to match.
  ///
  /// If no records match the filter conditions, an exception is thrown.
  ///
  /// Returns a [Result] containing null if the query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

      if (count == 0) throw RecordNotFoundException('with filter $filter');

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

  /// Deletes a single record from the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [id] is the unique identifier of the record to delete.
  ///
  /// If no record matches the given id, an exception is thrown.
  ///
  /// Returns a [Result] containing null if the query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

      if (count == 0) throw RecordNotFoundException('with id $id');

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

  /// Deletes multiple records from the specified table.
  ///
  /// [table] is the name of the database table to query.
  /// [filter] is a map of key-value pairs that are used to filter the records.
  ///
  /// If no records match the given filter, an exception is thrown.
  ///
  /// Returns a [Result] containing null if the query is successful.
  /// Throws an exception if an error occurs while performing the query.
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

      if (count == 0) throw RecordNotFoundException('with filter $filter');

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
