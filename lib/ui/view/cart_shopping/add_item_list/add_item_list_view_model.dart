import 'dart:developer';

import 'package:compras/domain/dto/list_item/list_item_dto.dart';
import 'package:compras/domain/models/list_item/list_item_model.dart';
import 'package:compras/domain/user_cases/add_item_list_user_case.dart';
import 'package:compras/utils/command.dart';
import 'package:compras/utils/result.dart';

class AddItemListViewModel {
  final AddItemListUserCase _userCase;

  AddItemListViewModel(this._userCase) {
    save = Command1<ListItemModel, ListItemDto>(_save);
    update = Command1<ListItemModel, ListItemModel>(_update);
  }

  late Command1<ListItemModel, ListItemDto> save;
  late Command1<ListItemModel, ListItemModel> update;

  Future<Result<ListItemModel>> _save(ListItemDto itemDto) async {
    final result = await _userCase.save(itemDto);

    switch (result) {
      case Success(value: final item):
        log('Item added: ${item.name}');
        break;

      case Failure(:final error):
        log('Error adding item: $error');
        break;
    }

    return result;
  }

  Future<Result<ListItemModel>> _update(ListItemModel item) async {
    final result = await _userCase.update(item);

    switch (result) {
      case Success(value: final item):
        log('Item updated: ${item.name}');
        break;

      case Failure(:final error):
        log('Error updating item: $error');
        break;
    }

    return result;
  }
}
