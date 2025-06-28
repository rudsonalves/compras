import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '/data/services/database/tables/sql_configurations.dart';
import '/data/services/database/tables/sql_tables.dart';

class DatabaseManager {
  DatabaseManager();

  Database? _database;

  Database get database {
    if (_database == null) throw Exception('Database is not initialized');
    return _database!;
  }

  bool _started = false;

  Future<Database> initialize(String? dbFileName) async {
    if (_started) return _database!;
    _started = true;

    String dbPath = await getDatabasesPath();
    String dbFilePath = join(dbPath, dbFileName ?? SqlConfigurations.dbName);

    _database = await openDatabase(
      dbFilePath,
      version: SqlConfigurations.dbVersion,
      onCreate: _createTables,
      onConfigure: _configureDatabase,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
      singleInstance: true,
    );

    return _database!;
  }

  Future<void> _createTables(Database db, int version) async {
    log('Creating tables');

    final batch = db.batch();

    // Tables
    batch.execute(SqlTables.shopping);
    batch.execute(SqlTables.products);
    batch.execute(SqlTables.items);
    batch.execute(SqlTables.lastPrices);
    // Indexes
    batch.execute(SqlTables.productNameIndex);
    batch.execute(SqlTables.productBarCodeIndex);
    batch.execute(SqlTables.lastPriceIndex);

    await batch.commit();
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    log('Database upgraded from version $oldVersion to $newVersion');
  }

  void _onDowngrade(Database db, int oldVersion, int newVersion) {
    log('Database downgraded from version $oldVersion to $newVersion');
  }

  Future<void> _configureDatabase(Database db) async {
    await db.execute(SqlConfigurations.enableForeignKeys);
  }

  Future<void> close() async {
    if (_database != null) await _database!.close();
  }
}
