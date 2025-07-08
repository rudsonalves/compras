import 'dart:developer';

import '/domain/dto/cart_item_dto/cart_item_dto.dart';
import '/domain/dto/product/product_dto.dart';
import '/domain/models/category/category_model.dart';
import '/domain/models/item/item_model.dart';
import '/domain/models/product/product_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/domain/user_cases/shopping_cart_user_case.dart';
import '/utils/command.dart';
import '/utils/result.dart';

class AddProductCartViewModel {
  final ShoppingCartUserCase _userCase;

  AddProductCartViewModel(this._userCase) {
    // load = Command0<void>(_userCase.load)..execute();
    saving = Command1<void, CartItemDto>(_save);
    update = Command1<void, ItemModel>(_update);
    findProductByBarCode = Command1<ProductModel?, String>(
      _findProductByBarCode,
    );
    fetchAllSubcategories = Command1<List<SubCategoryModel>, String>(
      _fetchAllSubcategories,
    );
  }

  // late final Command0<void> load;
  late final Command1<void, CartItemDto> saving;
  late final Command1<void, ItemModel> update;
  late final Command1<ProductModel?, String> findProductByBarCode;
  late final Command1<(CategoryModel, SubCategoryModel), String> getSubCategory;
  late final Command1<List<SubCategoryModel>, String> fetchAllSubcategories;

  ProductModel? _product;

  List<CategoryModel> get categories => _userCase.categories;

  String? categoryIdFromName(String name) {
    try {
      final category = categories.firstWhere((c) => c.name == name);
      return category.id;
    } catch (err) {
      return null;
    }
  }

  String? subCategoryIdFromName(String name, String categoryId) {
    try {
      final subCategory = _userCase.subCategories.firstWhere(
        (c) => (c.name == name && c.categoryId == categoryId),
      );
      return subCategory.id;
    } catch (err) {
      return null;
    }
  }

  List<String> get categoriesNames =>
      List.unmodifiable(_userCase.categories.map((c) => c.name));

  List<String> subCategoriesNames(String categoryId) => List.unmodifiable(
    _userCase.subCategories
        .where((cs) => cs.categoryId == categoryId)
        .map((c) => c.name),
  );

  Future<Result<void>> _save(CartItemDto itemDto) async {
    final productDto = ProductDto.fromCartItemDto(itemDto);

    // If the product doesn't exist, create it
    if (itemDto.productId == null) {
      final result = await _userCase.saveProduct(productDto);
      switch (result) {
        case Success(value: final product):
          _product = product;
          log('Create a new product');
          break;
        case Failure(:final error):
          log('Error saving product: $error');
          return Result.failure(error);
      }
    } else if (!productDto.isEqualProductModel(_product!)) {
      // If the product has changed, update it
      final updateProduct = ProductModel.fromDto(_product!.id, productDto);
      final result = await _userCase.updateProduct(updateProduct);

      switch (result) {
        case Success():
          log('Product updated');
          break;
        case Failure(:final error):
          log('Error updating product: $error');
          return Result.failure(error);
      }
    }

    final item = ItemModel.fromCartItemDto(_product!.id, itemDto);

    final result = await _userCase.saveItem(item);

    switch (result) {
      case Success():
        log('Item saved');
        return Result.success(null);
      case Failure(:final error):
        log('Error saving item: $error');
        return Result.failure(error);
    }
  }

  Future<Result<void>> _update(ItemModel item) async {
    final result = await _userCase.update(item);

    switch (result) {
      case Success():
        log('Item updated');
        return Result.success(null);
      case Failure(:final error):
        log('Error updating item: $error');
        return Result.failure(error);
    }
  }

  Future<Result<ProductModel?>> _findProductByBarCode(String barCode) async {
    final result = await _userCase.findProductByBarCode(barCode);

    if (result.isFailure) {
      log('Error finding product by barcode: ${result.error}');
      return Result.failure(result.error!);
    }

    _product = result.value;

    if (_product!.categoryId == null || _product!.categoryId!.isEmpty) {
      log('Product found without category: ${_product!.name}');
      return Result.success(_product);
    }

    final resultCategory = await _userCase.fetchAllSubcategories(
      _product!.categoryId!,
    );

    switch (resultCategory) {
      case Success():
        log('Product found: $result');
        return Result.success(_product);
      case Failure(:final error):
        log('Error finding product: $error');
        return Result.failure(error);
    }
  }

  Future<Result<List<SubCategoryModel>>> _fetchAllSubcategories(
    String categoryId,
  ) async {
    final result = await _userCase.fetchAllSubcategories(categoryId);
    return result;
  }
}
