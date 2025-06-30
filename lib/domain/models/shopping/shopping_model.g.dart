// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingModel _$ShoppingModelFromJson(Map<String, dynamic> json) =>
    _ShoppingModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ShoppingTypeEnumMap, json['type']),
      totalPrice: (json['total_price'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ShoppingModelToJson(_ShoppingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$ShoppingTypeEnumMap[instance.type]!,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$ShoppingTypeEnumMap = {
  ShoppingType.supermarket: 'supermarket',
  ShoppingType.pharmacy: 'pharmacy',
  ShoppingType.groceryStore: 'groceryStore',
  ShoppingType.other: 'other',
};
