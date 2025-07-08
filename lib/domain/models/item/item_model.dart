import 'package:compras/domain/dto/cart_item_dto/cart_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    required String name,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'unit_price') required int unitPrince,
    @Default(1) int quantity,
    @Default(0) @JsonKey(name: 'price_variation') double priceVariation,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ItemModel;

  factory ItemModel.create({
    required String shoppingId,
    required String productId,
    required String name,
    SaleBy saleBy = SaleBy.unit,
    required int unitPrince,
    int quantity = 1,
    double priceVariation = 0,
  }) => ItemModel(
    shoppingId: shoppingId,
    productId: productId,
    name: name,
    saleBy: saleBy,
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
      saleBy: dto.saleBy,
      unitPrince: dto.price,
      quantity: dto.quantity,
      priceVariation: 0.0,
      createdAt: DateTime.now(),
    );
  }
}
