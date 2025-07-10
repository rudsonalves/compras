import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';

part 'cart_item_dto.freezed.dart';
// part 'cart_item_dto.g.dart';

@freezed
abstract class CartItemDto with _$CartItemDto {
  const factory CartItemDto({
    required String shoppingId,
    @JsonKey(name: 'product_id') String? productId,
    required String name,
    String? description,
    @JsonKey(name: 'bar_code') String? barCode,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category') String? categoryName,
    @JsonKey(name: 'sub_category_id') String? subCategoryId,
    @JsonKey(name: 'sub_category') String? subCategoryName,
    @Default(0) int price,
    @Default(1) int quantity,
  }) = _CartItemDto;
}
