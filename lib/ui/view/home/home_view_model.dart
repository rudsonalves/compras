import '/data/repositories/shopping/i_shopping_repository.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/command.dart';

class HomeViewModel {
  final IShoppingRepository _shoppingRepository;

  HomeViewModel({
    required IShoppingRepository shoppingRepository,
  }) : _shoppingRepository = shoppingRepository {
    load = Command0<void>(_shoppingRepository.initialize);
  }

  late Command0<void> load;

  List<ShoppingModel> get shopping => _shoppingRepository.shoppingList;
}
