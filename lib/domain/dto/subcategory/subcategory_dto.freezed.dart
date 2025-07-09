// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subcategory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubcategoryDto {

@JsonKey(name: 'category_id') String get categoryId; String get name;
/// Create a copy of SubcategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubcategoryDtoCopyWith<SubcategoryDto> get copyWith => _$SubcategoryDtoCopyWithImpl<SubcategoryDto>(this as SubcategoryDto, _$identity);

  /// Serializes this SubcategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubcategoryDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,name);

@override
String toString() {
  return 'SubcategoryDto(categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class $SubcategoryDtoCopyWith<$Res>  {
  factory $SubcategoryDtoCopyWith(SubcategoryDto value, $Res Function(SubcategoryDto) _then) = _$SubcategoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class _$SubcategoryDtoCopyWithImpl<$Res>
    implements $SubcategoryDtoCopyWith<$Res> {
  _$SubcategoryDtoCopyWithImpl(this._self, this._then);

  final SubcategoryDto _self;
  final $Res Function(SubcategoryDto) _then;

/// Create a copy of SubcategoryDto
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

class _SubcategoryDto implements SubcategoryDto {
  const _SubcategoryDto({@JsonKey(name: 'category_id') required this.categoryId, required this.name});
  factory _SubcategoryDto.fromJson(Map<String, dynamic> json) => _$SubcategoryDtoFromJson(json);

@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  String name;

/// Create a copy of SubcategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubcategoryDtoCopyWith<_SubcategoryDto> get copyWith => __$SubcategoryDtoCopyWithImpl<_SubcategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubcategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubcategoryDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,name);

@override
String toString() {
  return 'SubcategoryDto(categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SubcategoryDtoCopyWith<$Res> implements $SubcategoryDtoCopyWith<$Res> {
  factory _$SubcategoryDtoCopyWith(_SubcategoryDto value, $Res Function(_SubcategoryDto) _then) = __$SubcategoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class __$SubcategoryDtoCopyWithImpl<$Res>
    implements _$SubcategoryDtoCopyWith<$Res> {
  __$SubcategoryDtoCopyWithImpl(this._self, this._then);

  final _SubcategoryDto _self;
  final $Res Function(_SubcategoryDto) _then;

/// Create a copy of SubcategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? name = null,}) {
  return _then(_SubcategoryDto(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
