// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListItemDto _$ListItemDtoFromJson(Map<String, dynamic> json) => _ListItemDto(
  shoppingId: json['shopping_id'] as String,
  productId: json['product_id'] as String?,
  name: json['name'] as String,
  isUnit: json['is_unit'] as bool? ?? true,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ListItemDtoToJson(_ListItemDto instance) =>
    <String, dynamic>{
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'name': instance.name,
      'is_unit': instance.isUnit,
      'quantity': instance.quantity,
      'created_at': instance.createdAt?.toIso8601String(),
    };
