// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  shoppingId: json['shopping_id'] as String,
  productId: json['product_id'] as String,
  isUnitPrice: json['is_unit_price'] as bool? ?? true,
  unitPrince: (json['unit_price'] as num).toInt(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'is_unit_price': instance.isUnitPrice,
      'unit_price': instance.unitPrince,
      'quantity': instance.quantity,
      'created_at': instance.createdAt?.toIso8601String(),
    };
