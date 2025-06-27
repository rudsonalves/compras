import 'dart:developer';

import 'package:flutter/material.dart';

import '/data/repositories/shopping/shopping_repository.dart';
import '/utils/result.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/command.dart';

class HomeViewModel {
  final ShoppingRepository _shoppingRepository;

  HomeViewModel({
    required ShoppingRepository shoppingRepository,
  }) : _shoppingRepository = shoppingRepository {
    load = Command0<void>(_shoppingRepository.initialize)..execute();
    delete = Command1<void, String>(_delete);
  }

  late final Command0<void> load;
  late final Command1<void, String> delete;

  List<ShoppingModel> get shoppings => _shoppingRepository.shoppingList;
  ChangeNotifier get notifier => _shoppingRepository;

  Future<Result<void>> _delete(String id) async {
    final result = await _shoppingRepository.delete(id);

    switch (result) {
      case Success():
        break;

      case Failure(:final error):
        log('Error deleting shopping: $error');
        break;
    }

    return result;
  }
}
