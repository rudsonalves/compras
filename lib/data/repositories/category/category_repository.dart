import 'dart:developer';

import '/data/repositories/category/i_category_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/services/database/tables/sql_tables.dart';
import '/domain/dto/sub_category/sub_category_dto.dart';
import '/domain/models/category/category_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/utils/result.dart';

class CategoryRepository implements ICategoryRepository {
  final DatabaseService _dbService;

  CategoryRepository(this._dbService);

  final Map<String, CategoryModel> _categories = {};
  final Map<String, SubCategoryModel> _subCategories = {};
  final List<String> _loadsCategoryIds = [];

  String? _categoryId;
  bool _isInitialized = false;

  @override
  List<CategoryModel> get categories => List.unmodifiable(_categories.values);

  List<SubCategoryModel> get subCategories =>
      List.unmodifiable(_subCategories.values);

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    final result = await fetchCategories();

    switch (result) {
      case Success():
        log('Categories initialized');
        return Result.success(null);

      case Failure(:final error):
        log('Error fetching categories: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<List<CategoryModel>>> fetchCategories() async {
    _categories.clear();

    final result = await _dbService.fetchAll<CategoryModel>(
      Tables.categories,
      fromMap: CategoryModel.fromJson,
      orderBy: CategoriesColumns.name,
    );

    switch (result) {
      case Success(:final value):
        for (var category in value) {
          _categories[category.id] = category;
        }
        return Result.success(categories);

      case Failure(:final error):
        log('Error fetching categories: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<List<SubCategoryModel>>> fetchSubCategories(
    String categoryId,
  ) async {
    if (_categoryId == categoryId) {
      return Result.success(subCategories);
    }

    _categoryId = categoryId;

    final result = await _dbService.fetchAll<SubCategoryModel>(
      Tables.subCategories,
      fromMap: SubCategoryModel.fromJson,
      filter: {SubCategoriesColumns.categoryId: categoryId},
      orderBy: SubCategoriesColumns.name,
    );

    switch (result) {
      case Success(:final value):
        _loadsCategoryIds.add(categoryId);
        for (var subCategory in value) {
          _subCategories[subCategory.id] = subCategory;
        }
        return Result.success(subCategories);

      case Failure(:final error):
        log('Error fetching subCategories: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<SubCategoryModel>> fetchSubCategory(
    String subCategoryId,
  ) async {
    if (_subCategories.containsKey(subCategoryId)) {
      return Result.success(_subCategories[subCategoryId]!);
    }

    final result = await _dbService.fetchById<SubCategoryModel>(
      Tables.subCategories,
      fromMap: SubCategoryModel.fromJson,
      id: subCategoryId,
    );

    switch (result) {
      case Success(value: final subCategory):
        _subCategories[subCategoryId] = subCategory;
        return Result.success(subCategory);

      case Failure(:final error):
        log('Error fetching subCategories: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<CategoryModel>> insertCategory(String name) async {
    if (_findCategoryId(name) != null) {
      return Result.failure(Exception('Category already exists'));
    }

    final result = await _dbService.insert<CategoryModel>(
      Tables.categories,
      {
        CategoriesColumns.name: name,
      },
    );

    switch (result) {
      case Success(value: final id):
        final category = CategoryModel(id: id, name: name);
        _categories[id] = category;
        return Result.success(category);

      case Failure(:final error):
        log('Error inserting category: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<SubCategoryModel>> insertSubCategory(SubCategoryDto dto) async {
    if (await _findSubCategoryId(dto.categoryId, dto.name) != null) {
      return Result.failure(Exception('SubCategory already exists'));
    }

    final result = await _dbService.insert<SubCategoryModel>(
      Tables.subCategories,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final subCategory = SubCategoryModel.fromDto(id, dto);
        _subCategories[id] = subCategory;
        return Result.success(subCategory);

      case Failure(:final error):
        log('Error inserting subCategory: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<CategoryModel>> updateCategory(CategoryModel category) async {
    final result = await _dbService.update<CategoryModel>(
      Tables.categories,
      map: category.toJson(),
    );

    switch (result) {
      case Success():
        _categories[category.id] = category;
        return Result.success(category);

      case Failure(:final error):
        log('Error updating category: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<SubCategoryModel>> updatesubCategory(
    SubCategoryModel subCategory,
  ) async {
    if (_categoryId != subCategory.categoryId) {
      await fetchSubCategories(subCategory.categoryId);
    }

    final result = await _dbService.update<SubCategoryModel>(
      Tables.subCategories,
      map: subCategory.toJson(),
    );

    switch (result) {
      case Success():
        _subCategories[subCategory.id] = subCategory;
        return Result.success(subCategory);

      case Failure(:final error):
        log('Error updating subCategory: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> deleteCategory(String id) async {
    final result = await _dbService.delete<CategoryModel>(
      Tables.categories,
      id: id,
    );

    switch (result) {
      case Success():
        _categories.remove(id);
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting category: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<void>> deleteSubCategory(String id) async {
    final result = await _dbService.delete<SubCategoryModel>(
      Tables.subCategories,
      id: id,
    );

    switch (result) {
      case Success():
        _subCategories.remove(id);
        return Result.success(null);

      case Failure(:final error):
        log('Error deleting subCategory: $error');
        return Result.failure(error);
    }
  }

  /// Finds the ID of a category by its name.
  ///
  /// Iterates through the list of categories and returns the
  /// ID of the category that matches the given name. If no
  /// category with the specified name is found, returns null.
  ///
  /// [name] is the name of the category to search for.
  ///
  /// Returns a [String] representing the category ID if found,
  /// otherwise returns null.
  String? _findCategoryId(String name) {
    for (final category in categories) {
      if (category.name == name) {
        return category.id;
      }
    }

    return null;
  }

  /// Finds the ID of a subcategory by its name and category ID.
  ///
  /// Iterates through the list of subcategories associated with the given category
  /// and returns the ID of the subcategory that matches the given name. If no
  /// subcategory with the specified name is found, returns null.
  ///
  /// [categoryId] is the category ID of the subcategory to search for.
  ///
  /// [name] is the name of the subcategory to search for.
  ///
  /// Returns a [String] representing the subcategory ID if found, otherwise
  /// returns null.
  Future<String?> _findSubCategoryId(String categoryId, String name) async {
    if (_categoryId != categoryId) {
      await fetchSubCategories(categoryId);
    }

    for (final subCategory in subCategories) {
      if (subCategory.name == name) {
        return subCategory.id;
      }
    }

    return null;
  }
}
