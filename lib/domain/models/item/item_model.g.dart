// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  shoppingId: json['shopping_id'] as String,
  productId: json['product_id'] as String,
  prince: (json['prince'] as num).toInt(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'prince': instance.prince,
      'quantity': instance.quantity,
    };
