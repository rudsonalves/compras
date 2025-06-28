import 'package:flutter/material.dart';

import '/domain/dto/shopping/shopping_dto.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/result.dart';

abstract class IShoppingRepository extends ChangeNotifier {
  List<ShoppingModel> get shoppingList;

  Future<Result<void>> initialize();

  Future<Result<ShoppingModel>> insert(ShoppingDto dto);

  Future<Result<List<ShoppingModel>>> fetchAll({
    int limit = 10,
    int offset = 0,
  });

  Future<Result<ShoppingModel>> fetch(String id);

  Future<Result<ShoppingModel>> update(ShoppingModel shopping);

  Future<Result<void>> delete(String id);
}
