// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    _SubCategoryModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubCategoryModelToJson(_SubCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
    };
