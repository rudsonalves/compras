import 'dart:developer';

import '/domain/dto/category_subcategory/category_subcategory_dto.dart';
import '/domain/dto/product/product_dto.dart';
import '/domain/models/category/category_model.dart';
import '/data/repositories/category/i_category_repository.dart';
import '/domain/models/item/item_model.dart';
import '/domain/models/product/product_model.dart';
import '../models/subcategory/subcategory_model.dart';
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

  List<SubcategoryModel> get subCategories => _categoryRepository.subCategories;

  List<ItemModel> get itemsList => _cartItemsRepository.itemsList;

  Future<Result<List<CategorySubcategoryDto>>> searchCategory(
    String query,
  ) => _categoryRepository.search(query);

  Future<Result<void>> load() async {
    final productsResult = await _productsRepository.initialize();
    if (productsResult.isFailure) return Result.failure(productsResult.error!);

    final cartresult = await _cartItemsRepository.initialize(_shopping.id);
    if (cartresult.isFailure) return Result.failure(cartresult.error!);

    final lastResult = await _lastPriceRepository.initialize();
    if (lastResult.isFailure) return Result.failure(lastResult.error!);

    switch (lastResult) {
      case Success():
        log('Last price loaded successfully');
        return Result.success(null);
      case Failure(:final error):
        log('Error loading last price: $error');
        return Result.failure(error);
    }
  }

  Future<Result<void>> saveItem(ItemModel item) async {
    final result = await _cartItemsRepository.insert(item);

    switch (result) {
      case Success(value: final item):
        log('Item saved successfully: ${item.name}');
        return Result.success(null);
      case Failure(error: final error):
        log('Error saving item: $error');
        return Result.failure(result.error);
    }
  }

  Future<Result<void>> update(ItemModel item) async {
    final result = await _cartItemsRepository.update(item);

    switch (result) {
      case Success(value: final item):
        log('Item updated successfully: ${item.name}');
        return Result.success(null);
      case Failure(error: final error):
        log('Error updating item: $error');
        return Result.failure(result.error);
    }
  }

  Future<Result<ProductModel?>> findProductByBarCode(String barCode) async {
    final productResult = await _productsRepository.fetchByBarCode(barCode);
    if (productResult.isFailure) return productResult;

    final product = productResult.value!;
    final categoryId = product.categoryId;

    if (categoryId != null && categoryId.isNotEmpty) {
      await _categoryRepository.fetchSubcategoriesFrom(categoryId);
    }

    switch (productResult) {
      case Success(value: final product):
        log('Product found successfully: ${product.name}');
        return Result.success(product);
      case Failure(error: final error):
        log('Error finding product: $error');
        return Result.failure(error);
    }
  }

  Future<Result<SubcategoryModel>> fetchSubcategory(
    String subCategoryId,
  ) async {
    final result = await _categoryRepository.fetchSubcategory(subCategoryId);

    switch (result) {
      case Success(value: final subCategory):
        log('Subcategory found successfully: ${subCategory.name}');
        return Result.success(subCategory);
      case Failure(error: final error):
        log('Error finding subcategory: $error');
        return Result.failure(error);
    }
  }

  Future<Result<List<SubcategoryModel>>> fetchSubcategoryList(
    String categoryId,
  ) async {
    final result = await _categoryRepository.fetchSubcategoriesFrom(categoryId);

    switch (result) {
      case Success(value: final subCategories):
        log('Subcategory list loaded successfully');
        return Result.success(subCategories);
      case Failure(error: final error):
        log('Error loading subcategory list: $error');
        return Result.failure(error);
    }
  }

  Future<Result<ProductModel>> saveProduct(ProductDto productDto) async {
    final result = await _productsRepository.insert(productDto);

    switch (result) {
      case Success(value: final product):
        log('Product saved successfully: ${product.name}');
        return Result.success(product);
      case Failure(error: final error):
        log('Error saving product: $error');
        return Result.failure(error);
    }
  }

  Future<Result<ProductModel>> updateProduct(ProductModel product) async {
    final result = await _productsRepository.update(product);

    switch (result) {
      case Success(value: final product):
        log('Product updated successfully: ${product.name}');
        return Result.success(product);
      case Failure(error: final error):
        log('Error updating product: $error');
        return Result.failure(error);
    }
  }

  Future<Result<List<SubcategoryModel>>> fetchAllSubcategories(
    String categoryId,
  ) async {
    final result = await _categoryRepository.fetchSubcategoriesFrom(categoryId);

    switch (result) {
      case Success(value: final subCategories):
        log('Subcategory list loaded successfully');
        return Result.success(subCategories);
      case Failure(error: final error):
        log('Error loading subcategory list: $error');
        return Result.failure(error);
    }
  }
}
