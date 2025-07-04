import 'dart:developer';

import 'package:compras/utils/result.dart';

import '/data/repositories/shopping/i_shopping_repository.dart';
import '/domain/dto/shopping/shopping_dto.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/command.dart';

class EditShoppingViewModel {
  final IShoppingRepository _shoppingRepository;

  EditShoppingViewModel({
    required IShoppingRepository shoppingRepository,
  }) : _shoppingRepository = shoppingRepository {
    saving = Command1<ShoppingModel, ShoppingDto>(_saving);
    update = Command1<ShoppingModel, ShoppingModel>(_update);
  }

  late Command1<ShoppingModel, ShoppingDto> saving;
  late Command1<ShoppingModel, ShoppingModel> update;

  Future<Result<ShoppingModel>> _saving(ShoppingDto dto) async {
    final result = await _shoppingRepository.insert(dto);

    switch (result) {
      case Success(value: final model):
        log('Shopping saved: $model');
        break;

      case Failure(:final error):
        log('Error saving shopping: $error');
        break;
    }

    return result;
  }

  Future<Result<ShoppingModel>> _update(ShoppingModel model) async {
    final result = await _shoppingRepository.update(model);

    switch (result) {
      case Success():
        log('Shopping updated: $model');
        break;

      case Failure(:final error):
        log('Error updating shopping: $error');
        break;
    }

    return result;
  }
}
