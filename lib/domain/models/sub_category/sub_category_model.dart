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

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
