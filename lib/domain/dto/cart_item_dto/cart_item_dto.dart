import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_dto.freezed.dart';

@freezed
abstract class CartItemDto with _$CartItemDto {
  const factory CartItemDto({
    required String shoppingId,
    @JsonKey(name: 'product_id') String? productId,
    required String name,
    String? description,
    @JsonKey(name: 'bar_code') String? barCode,
    @Default(true) @JsonKey(name: 'is_unit') bool isUnit,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category') String? categoryName,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category') String? subCategoryName,
    @Default(0) int price,
    @Default(1) int quantity,
  }) = _CartItemDto;
}
