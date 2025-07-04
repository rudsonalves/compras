import '/domain/dto/product/product_dto.dart';
import '/domain/models/category/category_model.dart';
import '/data/repositories/category/i_category_repository.dart';
import '/domain/models/item/item_model.dart';
import '/domain/models/product/product_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/utils/result.dart';
import '/data/repositories/cart_items/i_cart_items_repository.dart';
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

  List<CategoryModel> get categories => _categoryRepository.categories;

  List<SubCategoryModel> get subCategories => _categoryRepository.subCategories;

  // Future<Result<List<SubCategoryModel>>> subCategories(
  //   String categoryId,
  // ) async {
  //   final result = await _categoryRepository.fetchAllSubCategories(categoryId);

  //   switch (result) {
  //     case Success(value: final subCategories):
  //       return Result.success(subCategories);

  //     case Failure(:final error):
  //       log('Error fetching subCategories: $error');
  //       return Result.success([]);
  //   }
  // }

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

  /// Finds a product by its barcode.
  ///
  /// If the product is not found, returns a failure result.
  ///
  /// If the product is found, but its category id is null or empty,
  /// returns a success result with the product.
  ///
  /// If the product is found and its category id is not null or empty,
  /// fetches the subcategory list for the category and returns a success
  /// result with the product.
  Future<Result<ProductModel?>> findProductByBarCode(String barCode) async {
    final productResult = await _productsRepository.fetchByBarCode(barCode);
    if (productResult.isFailure) return productResult;

    final product = productResult.value!;
    final categoryId = product.categoryId;

    if (categoryId != null && categoryId.isNotEmpty) {
      await _categoryRepository.fetchAllSubCategories(categoryId);
    }

    return Result.success(product);
  }

  /// Fetches a subcategory by its ID.
  ///
  /// If the subcategory is not found, returns a failure result.
  ///
  /// If the subcategory is found, returns a success result with the
  /// subcategory.
  Future<Result<SubCategoryModel>> fetchSubCategory(
    String subCategoryId,
  ) async {
    final result = await _categoryRepository.fetchSubCategory(subCategoryId);
    return result;
  }

  /// Fetches a list of subcategories for a given category ID.
  ///
  /// If the category has no subcategories, returns a success result with an
  /// empty list.
  ///
  /// If the category has subcategories, returns a success result with the list
  /// of subcategories.
  ///
  /// If an error occurs while fetching the subcategories, returns a failure
  /// result.
  Future<Result<List<SubCategoryModel>>> fetchSubCategoryList(
    String categoryId,
  ) async {
    final result = await _categoryRepository.fetchAllSubCategories(categoryId);
    return result;
  }

  Future<Result<ProductModel>> saveProduct(ProductDto productDto) async {
    final result = await _productsRepository.insert(productDto);
    return result;
  }

  Future<Result<ProductModel>> updateProduct(ProductModel product) async {
    final result = await _productsRepository.update(product);
    return result;
  }

  Future<Result<List<SubCategoryModel>>> fetchAllSubcategories(
    String categoryId,
  ) async {
    final result = await _categoryRepository.fetchAllSubCategories(categoryId);
    return result;
  }
}
