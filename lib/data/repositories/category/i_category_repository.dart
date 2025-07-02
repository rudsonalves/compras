import '/domain/dto/sub_category/sub_category_dto.dart';
import '/domain/models/category/category_model.dart';
import '/domain/models/sub_category/sub_category_model.dart';
import '/utils/result.dart';

abstract class ICategoryRepository {
  List<CategoryModel> get categories;
  // List<SubCategoryModel> get subCategories;

  Future<Result<void>> initialize();
  Future<Result<List<CategoryModel>>> fetchCategories();
  Future<Result<List<SubCategoryModel>>> fetchSubCategories(String categoryId);
  Future<Result<CategoryModel>> insertCategory(String name);
  Future<Result<SubCategoryModel>> insertSubCategory(SubCategoryDto dto);
  Future<Result<CategoryModel>> updateCategory(CategoryModel category);
  Future<Result<SubCategoryModel>> updatesubCategory(
    SubCategoryModel subCategory,
  );
  Future<Result<void>> deleteCategory(String id);
  Future<Result<void>> deleteSubCategory(String id);
}
