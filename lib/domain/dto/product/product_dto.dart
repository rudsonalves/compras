import 'package:compras/domain/dto/cart_item_dto/cart_item_dto.dart';
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
    String? description,
    @JsonKey(name: 'bar_code') required String barCode,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category_name') String? subCategoryName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductDto;

  factory ProductDto.create({
    required String name,
    String? description,
    required String barCode,
    SaleBy saleBy = SaleBy.unit,
    String? categoryId,
    String? categoryName,
    String? subCategoryId,
    String? subCategoryName,
  }) {
    final now = DateTime.now();
    return ProductDto(
      name: name,
      description: description,
      barCode: barCode,
      saleBy: saleBy,
      categoryId: categoryId,
      categoryName: categoryName,
      subCategoryId: subCategoryId,
      subCategoryName: subCategoryName,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  bool isEqualProductModel(ProductModel other) {
    return name == other.name &&
        description == other.description &&
        barCode == other.barCode &&
        saleBy == other.saleBy &&
        categoryId == other.categoryId &&
        categoryName == other.categoryName &&
        subCategoryId == other.subCategoryId &&
        subCategoryName == other.subCategoryName;
  }

  factory ProductDto.fromCartItemDto(CartItemDto dto) {
    final now = DateTime.now();
    return ProductDto(
      name: dto.name,
      description: dto.description,
      barCode: dto.barCode,
      saleBy: dto.saleBy,
      categoryId: dto.categoryId,
      categoryName: dto.categoryName,
      subCategoryId: dto.subCategoryId,
      subCategoryName: dto.subCategoryName,
      createdAt: now,
      updatedAt: now,
    );
  }
}
