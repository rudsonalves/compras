// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastPriceDto _$LastPriceDtoFromJson(Map<String, dynamic> json) =>
    _LastPriceDto(
      productId: json['product_id'] as String,
      saleBy: $enumDecode(_$SaleByEnumMap, json['sale_by']),
      lastUnitPrice: (json['last_unit_price'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$LastPriceDtoToJson(_LastPriceDto instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'sale_by': _$SaleByEnumMap[instance.saleBy]!,
      'last_unit_price': instance.lastUnitPrice,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$SaleByEnumMap = {SaleBy.unit: 'unit', SaleBy.weight: 'weight'};
