import 'dart:developer';

import '/domain/dto/category_subcategory/category_subcategory_dto.dart';
import '/data/repositories/category/i_category_repository.dart';
import '/data/services/database/database_service.dart';
import '/data/services/database/tables/sql_tables.dart';
import '../../../domain/dto/subcategory/subcategory_dto.dart';
import '/domain/models/category/category_model.dart';
import '../../../domain/models/subcategory/subcategory_model.dart';
import '/utils/result.dart';

class CategoryRepository implements ICategoryRepository {
  final DatabaseService _dbService;

  CategoryRepository(this._dbService);

  final Map<String, CategoryModel> _categories = {};
  final Map<String, SubcategoryModel> _subCategories = {};
  final List<String> _loadsCategoryIds = [];

  bool _isInitialized = false;

  @override
  List<CategoryModel> get categories => List.unmodifiable(_categories.values);

  @override
  List<SubcategoryModel> get subCategories =>
      List.unmodifiable(_subCategories.values);

  @override
  CategoryModel? category(String categoryId) => _categories[categoryId];

  @override
  Future<SubcategoryModel?> getSubcategory(
    String subCategoryId,
    String categoryId,
  ) async {
    if (_subCategories.containsKey(subCategoryId)) {
      return _subCategories[subCategoryId];
    }

    await fetchSubcategoriesFrom(categoryId);
    return _subCategories[subCategoryId];
  }

  @override
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Result.success(null);

    _isInitialized = true;

    final categoriesResult = await fetchAllCategories();
    if (categoriesResult is Failure) return categoriesResult;

    final result = await fetchAllSubcategories();

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
  Future<Result<List<CategoryModel>>> fetchAllCategories() async {
    _categories.clear();

    final result = await _dbService.fetchAll<CategoryModel>(
      Tables.categories,
      fromMap: CategoryModel.fromJson,
      orderBy: CatsColumns.name,
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
  Future<Result<List<SubcategoryModel>>> fetchSubcategoriesFrom(
    String categoryId,
  ) async {
    if (_loadsCategoryIds.contains(categoryId)) {
      return Result.success(subCategoriesList(categoryId));
    }

    final result = await _dbService.fetchAll<SubcategoryModel>(
      Tables.subCategories,
      fromMap: SubcategoryModel.fromJson,
      filter: {SubCatsColumns.categoryId: categoryId},
      orderBy: SubCatsColumns.name,
    );

    switch (result) {
      case Success(:final value):
        _loadsCategoryIds.add(categoryId);
        for (var subCategory in value) {
          _subCategories[subCategory.id] = subCategory;
        }
        return Result.success(subCategoriesList(categoryId));

      case Failure(:final error):
        log('Error fetching subCategories: $error');
        return Result.failure(error);
    }
  }

  @override
  Future<Result<SubcategoryModel>> fetchSubcategory(
    String subCategoryId,
  ) async {
    if (_subCategories.containsKey(subCategoryId)) {
      return Result.success(_subCategories[subCategoryId]!);
    }

    final result = await _dbService.fetchById<SubcategoryModel>(
      Tables.subCategories,
      fromMap: SubcategoryModel.fromJson,
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
        CatsColumns.name: name,
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
  Future<Result<SubcategoryModel>> insertSubcategory(SubcategoryDto dto) async {
    if (await _findSubcCategoryId(dto.categoryId, dto.name) != null) {
      return Result.failure(Exception('Subcategory already exists'));
    }

    final result = await _dbService.insert<SubcategoryModel>(
      Tables.subCategories,
      dto.toJson(),
    );

    switch (result) {
      case Success(value: final id):
        final subCategory = SubcategoryModel.fromDto(id, dto);
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
  Future<Result<SubcategoryModel>> updateSubcategory(
    SubcategoryModel subCategory,
  ) async {
    final result = await _dbService.update<SubcategoryModel>(
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
  Future<Result<void>> deleteSubcategory(String id) async {
    final result = await _dbService.delete<SubcategoryModel>(
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

  @override
  Future<Result<List<CategorySubcategoryDto>>> search(String query) async {
    try {
      if (!_isInitialized) await initialize();

      final normalized = query.trim().toLowerCase();
      final List<CategorySubcategoryDto> results = [];

      // 1) match on category name
      for (final category in categories) {
        if (category.name.toLowerCase().contains(normalized)) {
          // fetch subcategories for this category
          final subCategories = subCategoriesList(category.id);
          for (final subCategory in subCategories) {
            if (subCategory.categoryId == category.id) {
              results.add(
                CategorySubcategoryDto(
                  category: category,
                  subcategory: subCategory,
                ),
              );
            }
          }
        }
      }

      // 2) match on subcategory name
      for (final subCategory in _subCategories.values) {
        if (subCategory.name.toLowerCase().contains(normalized)) {
          final category = _categories[subCategory.categoryId];
          if (category != null) {
            results.add(
              CategorySubcategoryDto(
                category: category,
                subcategory: subCategory,
              ),
            );
          }
        }
      }

      return Result.success(results);
    } catch (err, stack) {
      log('Error in CategoryRepository.search: $err', stackTrace: stack);
      return Result.failure(Exception('search: err.toString()'));
    }
  }

  @override
  Future<Result<void>> fetchAllSubcategories() async {
    final result = await _dbService.fetchAll<SubcategoryModel>(
      Tables.subCategories,
      fromMap: SubcategoryModel.fromJson,
      orderBy: SubCatsColumns.name,
    );

    switch (result) {
      case Success(value: final subCategories):
        _subCategories.clear();
        for (final subCategory in subCategories) {
          _subCategories[subCategory.id] = subCategory;
        }
        return Result.success(null);
      case Failure(error: final error):
        log('Error loading subcategory list: $error');
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
  Future<String?> _findSubcCategoryId(String categoryId, String name) async {
    if (!_loadsCategoryIds.contains(categoryId)) {
      await fetchSubcategoriesFrom(categoryId);
    }

    for (final subCategory in subCategoriesList(categoryId)) {
      if (subCategory.name == name) {
        return subCategory.id;
      }
    }

    return null;
  }

  @override
  List<SubcategoryModel> subCategoriesList(String categoryId) =>
      List.unmodifiable(
        _subCategories.values.where((sc) => sc.categoryId == categoryId),
      );
}
