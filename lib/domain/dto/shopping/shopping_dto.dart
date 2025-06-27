import '/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_dto.freezed.dart';
part 'shopping_dto.g.dart';

@freezed
abstract class ShoppingDto with _$ShoppingDto {
  const factory ShoppingDto({
    required String name,
    required String description,
    required ShoppingType type,
    @Default(0) @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ShoppingDto;

  factory ShoppingDto.create({
    required String name,
    required String description,
    required ShoppingType type,
    int totalPrice = 0,
  }) {
    final now = DateTime.now();
    return ShoppingDto(
      name: name,
      description: description,
      type: type,
      totalPrice: totalPrice,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory ShoppingDto.fromJson(Map<String, dynamic> json) =>
      _$ShoppingDtoFromJson(json);
}
