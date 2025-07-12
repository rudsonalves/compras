import '/domain/dto/cart_item_dto/cart_item_dto.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    required String name,
    @Default(true) @JsonKey(name: 'sale_by') bool isUnit,
    @JsonKey(name: 'unit_price') required int unitPrince,
    @Default(1) int quantity,
    @Default(0) @JsonKey(name: 'price_variation') double priceVariation,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ItemModel;

  factory ItemModel.create({
    required String shoppingId,
    required String productId,
    required String name,
    bool isUnit = true,
    required int unitPrince,
    int quantity = 1,
    double priceVariation = 0,
  }) => ItemModel(
    shoppingId: shoppingId,
    productId: productId,
    name: name,
    isUnit: isUnit,
    unitPrince: unitPrince,
    quantity: quantity,
    priceVariation: priceVariation,
    createdAt: DateTime.now(),
  );

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  factory ItemModel.fromCartItemDto(String? productId, CartItemDto dto) {
    return ItemModel(
      shoppingId: dto.shoppingId,
      productId: productId ?? dto.productId!,
      name: dto.name,
      isUnit: dto.isUnit,
      unitPrince: dto.price,
      quantity: dto.quantity,
      priceVariation: 0.0,
      createdAt: DateTime.now(),
    );
  }
}
