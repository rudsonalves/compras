import '/data/repositories/category/i_category_repository.dart';
import '/domain/models/item/item_model.dart';
import '/domain/models/product/product_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/result.dart';
import '/data/repositories/items/i_cart_items_repository.dart';
import '/data/repositories/last_price/i_last_price_repository.dart';
import '/data/repositories/products/i_products_repository.dart';

class ShoppingCartUserCase {
  final ShoppingModel _shopping;
  final IProductsRepository _productsRepository;
  final ICartItemsRepository _cartItemsRepository;
  final ILastPriceRepository _lastPriceRepository;
  final ICategoryRepository _categoryRepository;

  ShoppingCartUserCase({
    required ShoppingModel shopping,
    required IProductsRepository productsRepository,
    required ICartItemsRepository cartItemsRepository,
    required ILastPriceRepository lastPriceRepository,
    required ICategoryRepository categoryRepository,
  }) : _shopping = shopping,
       _productsRepository = productsRepository,
       _cartItemsRepository = cartItemsRepository,
       _lastPriceRepository = lastPriceRepository,
       _categoryRepository = categoryRepository;

  ICartItemsRepository get cartItemsRepository => _cartItemsRepository;

  Future<Result<void>> load() async {
    final productsResult = await _productsRepository.initialize();
    if (productsResult.isFailure) return Result.failure(productsResult.error!);

    final cartresult = await _cartItemsRepository.initialize(_shopping.id);
    if (cartresult.isFailure) return Result.failure(cartresult.error!);

    final lastResult = await _lastPriceRepository.initialize();
    if (lastResult.isFailure) return Result.failure(lastResult.error!);

    return Result.success(null);
  }

  Future<Result<void>> save(ItemModel item) async {
    // final result = await _cartItemsRepository.insert(item);
    // if (result.isFailure) return Result.failure(result.error!);
    await Future.delayed(const Duration(seconds: 2));
    return Result.success(null);
  }

  Future<Result<void>> update(ItemModel item) async {
    // final result = await _cartItemsRepository.update(item);
    // if (result.isFailure) return Result.failure(result.error!);
    await Future.delayed(const Duration(seconds: 2));
    return Result.success(null);
  }

  Future<Result<ProductModel?>> findProductByBarCode(String barCode) async {
    // final result = await _productsRepository.(barCode);
    // if (result.isFailure) return Result.failure(result.error!);
    await Future.delayed(const Duration(seconds: 2));
    return Result.success(null);
  }

  Future<Result<SubCategoryModel>> getSubCategory(
    String subCategoryId,
  ) async {
    final result = await _categoryRepository.fetchSubCategory(subCategoryId);
    return result;
  }
}
