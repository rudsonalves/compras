import 'package:compras/domain/enums/enums.dart';

import '/domain/dto/product/product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
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
    String? subCategoryId,
  }) {
    final now = DateTime.now();
    return ProductModel(
      id: id,
      name: name,
      description: description,
      barCode: barCode,
      saleBy: saleBy,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
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
    subCategoryId: dto.subCategoryId,
    createdAt: dto.createdAt,
    updatedAt: dto.updatedAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
