// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) =>
    _SubcategoryModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubcategoryModelToJson(_SubcategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
    };
