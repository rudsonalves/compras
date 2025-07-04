import '/domain/dto/sub_category/sub_category_dto.dart';
import '/domain/models/category/category_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/utils/result.dart';

abstract class ICategoryRepository {
  List<CategoryModel> get categories;
  List<SubCategoryModel> get subCategories;

  Future<SubCategoryModel?> getSubCategory(
    String subCategoryId,
    String categoryId,
  );

  /// Returns a category associated with the given [categoryId].
  /// If the category ID is not found, an null value is returned.
  CategoryModel? category(String categoryId);

  /// Initializes the category repository by fetching all categories from the
  /// database.
  /// If the repository is already initialized, it returns a successful result
  /// immediately.
  /// Logs a message on successful initialization or an error if the fetch
  /// operation fails.
  ///
  /// Returns a [Result] indicating the success or failure of the initialization
  /// process.

  Future<Result<void>> initialize();

  /// Fetches a list of categories from the database.
  ///
  /// Clears the internal category list cache and fetches all categories from
  /// the database, sorted by name. If the fetch operation fails, it logs an
  /// error message. If the fetch operation is successful, it logs a success
  /// message.
  ///
  /// Returns a [Result] containing a list of instances of type [CategoryModel]
  /// if the fetch operation is successful.
  /// Throws an exception if an error occurs while performing the fetch
  /// operation.
  Future<Result<List<CategoryModel>>> fetchAllCategories();

  /// Fetches a list of subcategories from the database, associated with a given
  /// category.
  ///
  /// If the subcategories for the given category are already loaded, it returns
  /// a successful result immediately. Otherwise, it fetches all subcategories
  /// from the database, sorted by name. If the fetch operation fails, it logs
  /// an error message. If the fetch operation is successful, it logs a success
  /// message.
  ///
  /// Returns a [Result] containing a list of instances of type
  /// [SubCategoryModel] if the fetch operation is successful. Throws an
  /// exception if an error occurs while performing the fetch operation.
  Future<Result<List<SubCategoryModel>>> fetchAllSubCategories(
    String categoryId,
  );

  /// Fetches a single subcategory by its ID from the database.
  ///
  /// If the subcategory with the given ID is already loaded, it returns a
  /// successful result immediately. Otherwise, it fetches the subcategory from
  /// the database.
  /// If the fetch operation fails, it logs an error message. If the fetch
  /// operation is successful, it logs a success message.
  ///
  /// Returns a [Result] containing an instance of type [SubCategoryModel] if
  /// the fetch operation is successful. Throws an exception if an error occurs
  /// while performing the fetch operation.
  Future<Result<SubCategoryModel>> fetchSubCategory(String subCategoryId);

  /// Inserts a category into the database.
  ///
  /// If a category with the given name already exists in the database, it
  /// immediately returns a failure result. Otherwise, it inserts the category
  /// into the database. If the insertion operation fails, it logs an error
  /// message. If the insertion operation is successful, it logs a success
  /// message.
  ///
  /// Returns a [Result] containing an instance of type [CategoryModel] if the
  /// insertion operation is successful. Throws an exception if an error occurs
  /// while performing the insertion operation.
  Future<Result<CategoryModel>> insertCategory(String name);

  /// Inserts a subcategory into the database.
  ///
  /// If a subcategory with the given name and category ID already exists in the
  /// database, it immediately returns a failure result. Otherwise, it inserts
  /// the subcategory into the database. If the insertion operation fails, it
  /// logs an error message. If the insertion operation is successful, it logs a
  /// success message.
  ///
  /// Returns a [Result] containing an instance of type [SubCategoryModel] if
  /// the insertion operation is successful. Throws an exception if an error
  /// occurs while performing the insertion operation.
  ///
  /// [dto] is the subcategory to insert.
  Future<Result<SubCategoryModel>> insertSubCategory(SubCategoryDto dto);

  /// Updates an existing category in the database.
  ///
  /// Takes a [CategoryModel] instance as input and updates the corresponding
  /// record in the database with the new data. If the update operation is
  /// successful, the internal category cache is also updated with the new
  /// category data. Logs an error message if the update operation fails.
  ///
  /// Returns a [Result] containing the updated [CategoryModel] if the update
  /// operation is successful, or a [Result] containing an error if it fails.
  Future<Result<CategoryModel>> updateCategory(CategoryModel category);

  /// Updates an existing subcategory in the database.
  ///
  /// Takes a [SubCategoryModel] instance as input and updates the corresponding
  /// record in the database with the new data. If the update operation is
  /// successful, the internal subcategory cache is also updated with the new
  /// subcategory data. Logs an error message if the update operation fails.
  ///
  /// Returns a [Result] containing the updated [SubCategoryModel] if the update
  /// operation is successful, or a [Result] containing an error if it fails.
  Future<Result<SubCategoryModel>> updateSubCategory(
    SubCategoryModel subCategory,
  );

  /// Deletes a category from the database.
  ///
  /// Takes a category ID as input and deletes the corresponding record from the
  /// database. If the deletion operation is successful, the internal category
  /// cache is also updated by removing the category with the given ID. Logs an
  /// error message if the deletion operation fails.
  ///
  /// Returns a [Result] containing null if the deletion operation is
  /// successful,
  /// or a [Result] containing an error if it fails.
  Future<Result<void>> deleteCategory(String id);

  /// Deletes a subcategory from the database.
  ///
  /// Takes a subcategory ID as input and deletes the corresponding record from
  /// the
  /// database. If the deletion operation is successful, the internal
  /// subcategory
  /// cache is also updated by removing the subcategory with the given ID. Logs
  /// an
  /// error message if the deletion operation fails.
  ///
  /// Returns a [Result] containing null if the deletion operation is
  /// successful,
  /// or a [Result] containing an error if it fails.
  Future<Result<void>> deleteSubCategory(String id);
}
