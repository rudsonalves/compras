// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubCategoryDto {

@JsonKey(name: 'category_id') String get categoryId; String get name;
/// Create a copy of SubCategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubCategoryDtoCopyWith<SubCategoryDto> get copyWith => _$SubCategoryDtoCopyWithImpl<SubCategoryDto>(this as SubCategoryDto, _$identity);

  /// Serializes this SubCategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubCategoryDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,name);

@override
String toString() {
  return 'SubCategoryDto(categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class $SubCategoryDtoCopyWith<$Res>  {
  factory $SubCategoryDtoCopyWith(SubCategoryDto value, $Res Function(SubCategoryDto) _then) = _$SubCategoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class _$SubCategoryDtoCopyWithImpl<$Res>
    implements $SubCategoryDtoCopyWith<$Res> {
  _$SubCategoryDtoCopyWithImpl(this._self, this._then);

  final SubCategoryDto _self;
  final $Res Function(SubCategoryDto) _then;

/// Create a copy of SubCategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? name = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubCategoryDto implements SubCategoryDto {
  const _SubCategoryDto({@JsonKey(name: 'category_id') required this.categoryId, required this.name});
  factory _SubCategoryDto.fromJson(Map<String, dynamic> json) => _$SubCategoryDtoFromJson(json);

@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  String name;

/// Create a copy of SubCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubCategoryDtoCopyWith<_SubCategoryDto> get copyWith => __$SubCategoryDtoCopyWithImpl<_SubCategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubCategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubCategoryDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,name);

@override
String toString() {
  return 'SubCategoryDto(categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SubCategoryDtoCopyWith<$Res> implements $SubCategoryDtoCopyWith<$Res> {
  factory _$SubCategoryDtoCopyWith(_SubCategoryDto value, $Res Function(_SubCategoryDto) _then) = __$SubCategoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class __$SubCategoryDtoCopyWithImpl<$Res>
    implements _$SubCategoryDtoCopyWith<$Res> {
  __$SubCategoryDtoCopyWithImpl(this._self, this._then);

  final _SubCategoryDto _self;
  final $Res Function(_SubCategoryDto) _then;

/// Create a copy of SubCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? name = null,}) {
  return _then(_SubCategoryDto(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
