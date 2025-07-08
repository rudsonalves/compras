// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      barCode: json['bar_code'] as String,
      saleBy:
          $enumDecodeNullable(_$SaleByEnumMap, json['sale_by']) ?? SaleBy.unit,
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      subCategoryId: json['sub_category_id'] as String?,
      subCategoryName: json['sub_category_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'bar_code': instance.barCode,
      'sale_by': _$SaleByEnumMap[instance.saleBy]!,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'sub_category_id': instance.subCategoryId,
      'sub_category_name': instance.subCategoryName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SaleByEnumMap = {SaleBy.unit: 'unit', SaleBy.weight: 'weight'};
