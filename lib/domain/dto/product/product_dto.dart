import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/models/product/product_model.dart';
import '/domain/enums/enums.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
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
  }) = _ProductDto;

  factory ProductDto.create({
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

    return ProductDto(
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

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  bool isEqualModel(ProductModel other) {
    return name == other.name &&
        description == other.description &&
        barCode == other.barCode &&
        saleBy == other.saleBy &&
        categoryId == other.categoryId &&
        category == other.category &&
        subCategoryId == other.subCategoryId &&
        subCategory == other.subCategory;
  }
}
