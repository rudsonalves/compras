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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductDto;

  factory ProductDto.create({
    required String name,
    required String description,
    required String barCode,
  }) {
    final now = DateTime.now();

    return ProductDto(
      name: name,
      description: description,
      barCode: barCode,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
