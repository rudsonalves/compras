import 'package:compras/domain/dto/sub_category/sub_category_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
abstract class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromDto(String id, SubCategoryDto dto) =>
      SubCategoryModel(
        id: id,
        categoryId: dto.categoryId,
        name: dto.name,
      );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
