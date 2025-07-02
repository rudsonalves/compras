import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    @Default(SaleBy.unit) @JsonKey(name: 'sale_by') SaleBy saleBy,
    @JsonKey(name: 'unit_price') required int unitPrince,
    @Default(1) int quantity,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ItemModel;

  factory ItemModel.create({
    required String shoppingId,
    required String productId,
    SaleBy saleBy = SaleBy.unit,
    required int unitPrince,
    int quantity = 1,
  }) {
    final now = DateTime.now();
    return ItemModel(
      shoppingId: shoppingId,
      productId: productId,
      saleBy: saleBy,
      unitPrince: unitPrince,
      quantity: quantity,
      createdAt: now,
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
