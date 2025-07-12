import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/dto/product/product_dto.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    @JsonKey(name: 'bar_code') String? barCode,
    @Default(true) @JsonKey(name: 'is_unit') bool isUnit,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category_name') String? subCategoryName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.create({
    required String id,
    required String name,
    String? barCode,
    bool isUnit = true,
    String? categoryId,
    String? categoryName,
    String? subCategoryId,
    String? subCategoryName,
  }) {
    final now = DateTime.now();
    return ProductModel(
      id: id,
      name: name,
      barCode: barCode,
      isUnit: isUnit,
      categoryId: categoryId,
      categoryName: categoryName,
      subCategoryId: subCategoryId,
      subCategoryName: subCategoryName,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductModel.fromDto(String id, ProductDto dto) => ProductModel(
    id: id,
    name: dto.name,
    barCode: dto.barCode,
    isUnit: dto.isUnit,
    categoryId: dto.categoryId,
    categoryName: dto.categoryName,
    subCategoryId: dto.subCategoryId,
    subCategoryName: dto.subCategoryName,
    createdAt: dto.createdAt ?? DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
