import '/domain/models/category/category_model.dart';
import '/domain/models/subcategory/subcategory_model.dart';

class CategorySubcategoryDto {
  final CategoryModel category;
  final SubcategoryModel subcategory;

  const CategorySubcategoryDto({
    required this.category,
    required this.subcategory,
  });

  @override
  String toString() {
    return '${category.name} ￫ ${subcategory.name}';
  }

  static string(String categoryName, String subcategoryName) {
    return '$categoryName ￫ $subcategoryName';
  }
}
