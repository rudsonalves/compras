import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/dto/shopping/shopping_dto.dart';
import '/domain/enums/enums.dart';

part 'shopping_model.freezed.dart';
part 'shopping_model.g.dart';

@freezed
abstract class ShoppingModel with _$ShoppingModel {
  const ShoppingModel._();

  const factory ShoppingModel({
    required String id,
    required String name,
    required String description,
    required ShoppingType type,
    @Default(0) @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ShoppingModel;

  /// Helper factory to initialize a new purchase with current timestamps
  factory ShoppingModel.create({
    required String id,
    required String name,
    required String description,
    required ShoppingType type,
    int totalPrice = 0,
  }) {
    final now = DateTime.now();
    return ShoppingModel(
      id: id,
      name: name,
      description: description,
      type: type,
      totalPrice: totalPrice,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ShoppingModel.fromDto(String id, ShoppingDto dto) => ShoppingModel(
    id: id,
    name: dto.name,
    description: dto.description,
    type: dto.type,
    totalPrice: dto.totalPrice,
    createdAt: dto.createdAt,
    updatedAt: dto.updatedAt,
  );

  /// JSON deserialization
  factory ShoppingModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingModelFromJson(json);
}
