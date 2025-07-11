// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListItemModel _$ListItemModelFromJson(Map<String, dynamic> json) =>
    _ListItemModel(
      id: json['id'] as String,
      shoppingId: json['shopping_id'] as String,
      productId: json['product_id'] as String?,
      name: json['name'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ListItemModelToJson(_ListItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
      'created_at': instance.createdAt?.toIso8601String(),
    };
