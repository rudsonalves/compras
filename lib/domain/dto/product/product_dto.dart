import 'package:compras/domain/models/sqlite_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    required String name,
    required String description,
    @JsonKey(name: 'bar_code') required String barCode,
    @Default(true)
    @JsonKey(
      name: 'is_unit_price',
      fromJson: SqliteHelpers.intToBool,
      toJson: SqliteHelpers.boolToInt,
    )
    bool isUnitPrice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductDto;

  factory ProductDto.create({
    required String name,
    required String description,
    required String barCode,
    bool isUnitPrice = true,
  }) {
    final now = DateTime.now();

    return ProductDto(
      name: name,
      description: description,
      barCode: barCode,
      isUnitPrice: isUnitPrice,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
