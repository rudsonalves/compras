import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dto/subcategory/subcategory_dto.dart';

part 'subcategory_model.freezed.dart';
part 'subcategory_model.g.dart';

@freezed
abstract class SubcategoryModel with _$SubcategoryModel {
  const factory SubcategoryModel({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
  }) = _SubcategoryModel;

  factory SubcategoryModel.fromDto(String id, SubcategoryDto dto) =>
      SubcategoryModel(
        id: id,
        categoryId: dto.categoryId,
        name: dto.name,
      );

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryModelFromJson(json);
}
