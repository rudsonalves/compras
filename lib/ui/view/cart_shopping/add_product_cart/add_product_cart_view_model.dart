import 'package:compras/domain/models/item/item_model.dart';

import '/domain/user_cases/shopping_cart_user_case.dart';
import '/utils/command.dart';
import '/utils/result.dart';

class AddProductCartViewModel {
  final ShoppingCartUserCase _userCase;

  AddProductCartViewModel(this._userCase) {
    // load = Command0<void>(_userCase.load)..execute();
    save = Command1<void, ItemModel>(_save);
    update = Command1<void, ItemModel>(_update);
  }

  // late final Command0<void> load;
  late final Command1 save;
  late final Command1 update;

  Future<Result<void>> _save(ItemModel item) async {
    await _userCase.save(item);
    return Result.success(null);
  }

  Future<Result<void>> _update(ItemModel item) async {
    await _userCase.update(item);
    return Result.success(null);
  }
}
