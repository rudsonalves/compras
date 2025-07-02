import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? category,
    String? subcategory,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductDto;

  factory ProductDto.create({
    required String name,
    required String description,
    required String barCode,
    SaleBy saleBy = SaleBy.unit,
    String? category,
    String? subcategory,
  }) {
    final now = DateTime.now();

    return ProductDto(
      name: name,
      description: description,
      barCode: barCode,
      saleBy: saleBy,
      category: category,
      subcategory: subcategory,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
