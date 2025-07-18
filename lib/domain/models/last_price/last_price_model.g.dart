// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastPriceModel _$LastPriceModelFromJson(Map<String, dynamic> json) =>
    _LastPriceModel(
      id: json['id'] as String,
      shoppingId: json['shopping_id'] as String,
      productId: json['product_id'] as String,
      lastUnitPrice: (json['last_unit_price'] as num).toInt(),
      saleBy: $enumDecode(_$SaleByEnumMap, json['sale_by']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$LastPriceModelToJson(_LastPriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopping_id': instance.shoppingId,
      'product_id': instance.productId,
      'last_unit_price': instance.lastUnitPrice,
      'sale_by': _$SaleByEnumMap[instance.saleBy]!,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$SaleByEnumMap = {SaleBy.unit: 'unit', SaleBy.weight: 'weight'};
