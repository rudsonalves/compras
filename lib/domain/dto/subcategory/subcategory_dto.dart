import 'package:freezed_annotation/freezed_annotation.dart';

part 'subcategory_dto.freezed.dart';
part 'subcategory_dto.g.dart';

@freezed
abstract class SubcategoryDto with _$SubcategoryDto {
  const factory SubcategoryDto({
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
  }) = _SubcategoryDto;

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryDtoFromJson(json);
}
