import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';
import '/domain/dto/product/product_dto.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    @JsonKey(name: 'bar_code') required String barCode,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category') String? subCategory,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.create({
    required String id,
    required String name,
    required String description,
    required String barCode,
    SaleBy saleBy = SaleBy.unit,
    String? categoryId,
    String? category,
    String? subCategoryId,
    String? subCategory,
  }) {
    final now = DateTime.now();
    return ProductModel(
      id: id,
      name: name,
      description: description,
      barCode: barCode,
      saleBy: saleBy,
      categoryId: categoryId,
      category: category,
      subCategoryId: subCategoryId,
      subCategory: subCategory,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductModel.fromDto(String id, ProductDto dto) => ProductModel(
    id: id,
    name: dto.name,
    description: dto.description,
    barCode: dto.barCode,
    saleBy: dto.saleBy,
    categoryId: dto.categoryId,
    category: dto.category,
    subCategoryId: dto.subCategoryId,
    createdAt: dto.createdAt,
    subCategory: dto.subCategory,
    updatedAt: dto.updatedAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
