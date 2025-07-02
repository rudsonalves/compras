import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_dto.freezed.dart';
part 'sub_category_dto.g.dart';

@freezed
abstract class SubCategoryDto with _$SubCategoryDto {
  const factory SubCategoryDto({
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
  }) = _SubCategoryDto;

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDtoFromJson(json);
}
