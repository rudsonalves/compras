import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';

part 'cart_item_dto.freezed.dart';
// part 'cart_item_dto.g.dart';

@freezed
abstract class CartItemDto with _$CartItemDto {
  const factory CartItemDto({
    required String shoppingId,
    required String name,
    required String description,
    @JsonKey(name: 'bar_code') required String barCode,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category') String? subCategory,
    @Default(0) int price,
    @Default(1) int quantity,
  }) = _CartItemDto;
}
