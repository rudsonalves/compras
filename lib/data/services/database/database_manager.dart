import 'dart:developer';

import 'package:compras/data/services/database/tables/sql_upgrades.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '/domain/models/category/category_model.dart';
import '../../../domain/models/subcategory/subcategory_model.dart';
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
      version: SqlUpgrades.dbVersion,
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
    batch.execute(SqlTables.categories);
    batch.execute(SqlTables.subCategories);
    // Indexes
    batch.execute(SqlTables.productNameIndex);
    batch.execute(SqlTables.productBarCodeIndex);
    batch.execute(SqlTables.lastPriceProductIndex);
    batch.execute(SqlTables.categoriesIndex);
    batch.execute(SqlTables.subCategoriesIndex);

    await batch.commit();

    await _populateCategoriesTables(db);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < SqlUpgrades.dbVersion) {
      log('Upgrading database to version ${SqlUpgrades.dbVersion}');

      for (int i = oldVersion + 1; i <= SqlUpgrades.dbVersion; i++) {
        final sqlUpgrade = SqlUpgrades.upgrades[i];
        if (sqlUpgrade != null) {
          db.execute(sqlUpgrade);
        }
      }

      _populateCategoriesTables(db);
    }
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

  Future<void> _populateCategoriesTables(Database db) async {
    log('Populating categories tables');

    final uuid = const Uuid();

    for (final categoryName in categories.keys) {
      final categoryId = uuid.v4();
      final category = CategoryModel(id: categoryId, name: categoryName);

      await db.insert(
        Tables.categories,
        category.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      final subCategoriesNames = categories[categoryName]!;

      for (final subCategoryName in subCategoriesNames) {
        final subCategoryId = uuid.v4();
        final subCategory = SubcategoryModel(
          id: subCategoryId,
          categoryId: categoryId,
          name: subCategoryName,
        );
        await db.insert(
          Tables.subCategories,
          subCategory.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }
}
