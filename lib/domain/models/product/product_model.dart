import '/domain/dto/product/product_dto.dart';
import 'package:flutter/foundation.dart';
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
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.create({
    required String id,
    required String name,
    required String description,
    required String barCode,
  }) {
    final now = DateTime.now();

    return ProductModel(
      id: id,
      name: name,
      description: description,
      barCode: barCode,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ProductModel.fromDto(String id, ProductDto dto) {
    return ProductModel(
      id: id,
      name: dto.name,
      description: dto.description,
      barCode: dto.barCode,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
