import 'package:compras/domain/models/item/item_model.dart';

import '/data/repositories/cart_items/i_cart_items_repository.dart';
import '/domain/user_cases/shopping_cart_user_case.dart';
import '/utils/command.dart';

class CartShoppingViewModel {
  final ShoppingCartUserCase _userCase;

  CartShoppingViewModel(this._userCase) {
    load = Command0<void>(_userCase.load)..execute();
  }

  late Command0<void> load;

  List<ItemModel> get itemsList => _userCase.itemsList;

  ICartItemsRepository get cartItemsNotifier => _userCase.cartItemsRepository;
}
