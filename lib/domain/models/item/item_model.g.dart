// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  shoppingId: json['shopping_id'] as String,
  productId: json['product_id'] as String,
  name: json['name'] as String,
  isUnit: json['sale_by'] as bool? ?? true,
  unitPrince: (json['unit_price'] as num).toInt(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  priceVariation: (json['price_variation'] as num?)?.toDouble() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'name': instance.name,
      'sale_by': instance.isUnit,
      'unit_price': instance.unitPrince,
      'quantity': instance.quantity,
      'price_variation': instance.priceVariation,
      'created_at': instance.createdAt?.toIso8601String(),
    };
