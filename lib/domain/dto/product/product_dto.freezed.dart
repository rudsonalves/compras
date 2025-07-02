// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDto implements DiagnosticableTreeMixin {

 String get name; String get description;@JsonKey(name: 'bar_code') String get barCode;@JsonKey(name: 'sale_by') SaleBy get saleBy; String? get category; String? get subcategory;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductDto'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('barCode', barCode))..add(DiagnosticsProperty('saleBy', saleBy))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('subcategory', subcategory))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.barCode, barCode) || other.barCode == barCode)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,barCode,saleBy,category,subcategory,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductDto(name: $name, description: $description, barCode: $barCode, saleBy: $saleBy, category: $category, subcategory: $subcategory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String name, String description,@JsonKey(name: 'bar_code') String barCode,@JsonKey(name: 'sale_by') SaleBy saleBy, String? category, String? subcategory,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? barCode = null,Object? saleBy = null,Object? category = freezed,Object? subcategory = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,barCode: null == barCode ? _self.barCode : barCode // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,subcategory: freezed == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductDto extends ProductDto with DiagnosticableTreeMixin {
  const _ProductDto({required this.name, required this.description, @JsonKey(name: 'bar_code') required this.barCode, @JsonKey(name: 'sale_by') this.saleBy = SaleBy.unit, this.category, this.subcategory, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

@override final  String name;
@override final  String description;
@override@JsonKey(name: 'bar_code') final  String barCode;
@override@JsonKey(name: 'sale_by') final  SaleBy saleBy;
@override final  String? category;
@override final  String? subcategory;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDtoCopyWith<_ProductDto> get copyWith => __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDtoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductDto'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('barCode', barCode))..add(DiagnosticsProperty('saleBy', saleBy))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('subcategory', subcategory))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.barCode, barCode) || other.barCode == barCode)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,barCode,saleBy,category,subcategory,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductDto(name: $name, description: $description, barCode: $barCode, saleBy: $saleBy, category: $category, subcategory: $subcategory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(_ProductDto value, $Res Function(_ProductDto) _then) = __$ProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String description,@JsonKey(name: 'bar_code') String barCode,@JsonKey(name: 'sale_by') SaleBy saleBy, String? category, String? subcategory,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(this._self, this._then);

  final _ProductDto _self;
  final $Res Function(_ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? barCode = null,Object? saleBy = null,Object? category = freezed,Object? subcategory = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProductDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,barCode: null == barCode ? _self.barCode : barCode // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,subcategory: freezed == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
