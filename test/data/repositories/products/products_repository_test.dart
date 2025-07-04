import 'package:compras/data/repositories/products/products_repository.dart';
import 'package:compras/data/services/database/database_manager.dart';
import 'package:compras/data/services/database/database_service.dart';
import 'package:compras/domain/dto/product/product_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseManager dbManager;
  late DatabaseService dbService;
  late ProductsRepository repo;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final dbPath = join(
      Directory.systemTemp.path,
      'test_compras_${DateTime.now().microsecondsSinceEpoch}.db',
    );

    if (await File(dbPath).exists()) {
      await deleteDatabase(dbPath);
    }

    dbManager = DatabaseManager();
    dbService = DatabaseService(await dbManager.initialize(dbPath));

    repo = ProductsRepository(dbService);
    await repo.initialize();
  });

  tearDown(() async {
    await dbManager.close();
  });

  test('Insert Shopping', () async {
    final dto = ProductDto.create(
      name: 'Teste Shopping',
      description: 'Descrição teste',
      barCode: DateTime.now().microsecondsSinceEpoch.toString(),
    );

    final result = await repo.insert(dto);
    debugPrint(result.value!.toString());
    expect(result.isSuccess, true);
    expect(result.value?.name, dto.name);
  });

  Future<List<String>> insertShopping() async {
    final ids = <String>[];

    for (var i = 0; i < 10; i++) {
      final dto = ProductDto.create(
        name: 'Teste Shopping $i',
        description: 'Descrição teste $i',
        barCode: DateTime.now().microsecondsSinceEpoch.toString(),
      );

      final result = await repo.insert(dto);

      if (result.isSuccess) {
        ids.add(result.value!.id);
      }
    }

    return ids;
  }

  test('Fetch All Shoppings', () async {
    final ids = await insertShopping();

    final result = await repo.fetchAll();
    expect(result.isSuccess, true);
    expect(result.value!.isNotEmpty, true);
    expect(result.value!.length, ids.length);
  });

  test('Fetch Single Shopping', () async {
    final inserted = await repo.insert(
      ProductDto.create(
        name: 'Teste Fetch',
        description: 'Fetch Test',
        barCode: DateTime.now().microsecondsSinceEpoch.toString(),
      ),
    );

    final id = inserted.value!.id;
    final fetched = await repo.fetch(id);

    expect(fetched.isSuccess, true);
    expect(fetched.value!.id, id);
  });

  test('Update Shopping', () async {
    final ids = await insertShopping();

    final inserted = await repo.fetch(ids[ids.length ~/ 2]);

    final updatedShopping = inserted.value!.copyWith(name: 'Updated Name New');
    final updatedResult = await repo.update(updatedShopping);

    expect(updatedResult.isSuccess, true);
    expect(updatedResult.value!.name, 'Updated Name New');
  });

  test('Delete Shopping', () async {
    final inserted = await repo.insert(
      ProductDto.create(
        name: 'Teste Delete',
        description: 'Delete Test',
        barCode: DateTime.now().microsecondsSinceEpoch.toString(),
      ),
    );

    final deleteResult = await repo.delete(inserted.value!.id);

    expect(deleteResult.isSuccess, true);

    final fetchDeleted = await repo.fetch(inserted.value!.id);

    expect(fetchDeleted.isSuccess, false);
  });
}
