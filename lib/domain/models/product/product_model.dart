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
    String? description,
    @JsonKey(name: 'bar_code') String? barCode,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
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
    String? description,
    String? barCode,
    SaleBy saleBy = SaleBy.unit,
    String? categoryId,
    String? categoryName,
    String? subCategoryId,
    String? subCategoryName,
  }) {
    final now = DateTime.now();
    return ProductModel(
      id: id,
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

  factory ProductModel.fromDto(String id, ProductDto dto) => ProductModel(
    id: id,
    name: dto.name,
    description: dto.description,
    barCode: dto.barCode,
    saleBy: dto.saleBy,
    categoryId: dto.categoryId,
    categoryName: dto.categoryName,
    subCategoryId: dto.subCategoryId,
    subCategoryName: dto.subCategoryName,
    createdAt: dto.createdAt,
    updatedAt: DateTime.now(),
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
