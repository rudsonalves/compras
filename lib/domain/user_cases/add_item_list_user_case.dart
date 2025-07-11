import '/data/repositories/list_item/i_list_item_repository.dart';
import '/data/repositories/products/i_products_repository.dart';
import '/domain/dto/list_item/list_item_dto.dart';
import '/domain/models/list_item/list_item_model.dart';
import '/domain/models/product/product_model.dart';
import '/utils/result.dart';

class AddItemListUserCase {
  final IProductsRepository _productsRepository;
  final IListItemRepository _listItemRepository;

  AddItemListUserCase({
    required IProductsRepository productsRepository,
    required IListItemRepository listItemRepository,
  }) : _productsRepository = productsRepository,
       _listItemRepository = listItemRepository;

  List<ProductModel> get products => _productsRepository.productList;

  Future<Result<ListItemModel>> save(ListItemDto itemDto) async {
    final result = await _listItemRepository.insert(itemDto);
    return result;
  }

  Future<Result<ListItemModel>> update(ListItemModel itemDto) async {
    final result = await _listItemRepository.update(itemDto);
    return result;
  }

  Future<Result<void>> delete(String id) async {
    final result = await _listItemRepository.delete(id);
    return result;
  }
}
