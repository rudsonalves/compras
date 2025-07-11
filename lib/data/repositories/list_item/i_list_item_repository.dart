import '/domain/dto/list_item/list_item_dto.dart';
import '/domain/models/list_item/list_item_model.dart';
import '/utils/result.dart';

import 'package:flutter/material.dart';

abstract class IListItemRepository extends ChangeNotifier {
  Future<Result<void>> initialize(String shoppingId);

  Future<Result<ListItemModel>> insert(ListItemDto dto);

  Future<Result<void>> fetchAll(String shoppingId);

  Future<Result<ListItemModel>> update(ListItemModel item);

  Future<Result<void>> delete(String id);
}
