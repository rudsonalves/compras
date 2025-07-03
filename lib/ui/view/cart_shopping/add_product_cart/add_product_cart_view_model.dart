import 'package:compras/domain/models/category/category_model.dart';
import 'package:compras/domain/models/item/item_model.dart';
import 'package:compras/domain/models/product/product_model.dart';
import 'package:compras/domain/models/sub_category/sub_category_model.dart';

import '/domain/user_cases/shopping_cart_user_case.dart';
import '/utils/command.dart';
import '/utils/result.dart';

class AddProductCartViewModel {
  final ShoppingCartUserCase _userCase;

  AddProductCartViewModel(this._userCase) {
    // load = Command0<void>(_userCase.load)..execute();
    save = Command1<void, ItemModel>(_save);
    update = Command1<void, ItemModel>(_update);
    findProductByBarCode = Command1<ProductModel?, String>(
      _userCase.findProductByBarCode,
    );
  }

  // late final Command0<void> load;
  late final Command1<void, ItemModel> save;
  late final Command1<void, ItemModel> update;
  late final Command1<ProductModel?, String> findProductByBarCode;
  late final Command1<(CategoryModel, SubCategoryModel), String> getSubCategory;

  Future<Result<void>> _save(ItemModel item) async {
    await _userCase.save(item);
    return Result.success(null);
  }

  Future<Result<void>> _update(ItemModel item) async {
    await _userCase.update(item);
    return Result.success(null);
  }
}
