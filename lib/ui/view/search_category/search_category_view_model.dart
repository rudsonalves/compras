import '/domain/dto/category_subcategory/category_subcategory_dto.dart';
import '/domain/user_cases/shopping_cart_user_case.dart';
import '/utils/command.dart';

class SearchCategoryViewModel {
  final ShoppingCartUserCase _userCase;

  SearchCategoryViewModel(this._userCase) {
    search = Command1<List<CategorySubcategoryDto>, String>(
      _userCase.searchCategory,
    );
  }

  late Command1<List<CategorySubcategoryDto>, String> search;
}
