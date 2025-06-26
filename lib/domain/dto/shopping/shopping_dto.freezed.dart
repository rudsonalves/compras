// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingDto {

 String get name; String get description; ShoppingType get type;@JsonKey(name: 'total_price') int get totalPrice;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ShoppingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingDtoCopyWith<ShoppingDto> get copyWith => _$ShoppingDtoCopyWithImpl<ShoppingDto>(this as ShoppingDto, _$identity);

  /// Serializes this ShoppingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,type,totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingDto(name: $name, description: $description, type: $type, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingDtoCopyWith<$Res>  {
  factory $ShoppingDtoCopyWith(ShoppingDto value, $Res Function(ShoppingDto) _then) = _$ShoppingDtoCopyWithImpl;
@useResult
$Res call({
 String name, String description, ShoppingType type,@JsonKey(name: 'total_price') int totalPrice,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ShoppingDtoCopyWithImpl<$Res>
    implements $ShoppingDtoCopyWith<$Res> {
  _$ShoppingDtoCopyWithImpl(this._self, this._then);

  final ShoppingDto _self;
  final $Res Function(ShoppingDto) _then;

/// Create a copy of ShoppingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? type = null,Object? totalPrice = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShoppingType,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShoppingDto implements ShoppingDto {
  const _ShoppingDto({required this.name, required this.description, required this.type, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ShoppingDto.fromJson(Map<String, dynamic> json) => _$ShoppingDtoFromJson(json);

@override final  String name;
@override final  String description;
@override final  ShoppingType type;
@override@JsonKey(name: 'total_price') final  int totalPrice;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ShoppingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingDtoCopyWith<_ShoppingDto> get copyWith => __$ShoppingDtoCopyWithImpl<_ShoppingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,type,totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingDto(name: $name, description: $description, type: $type, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingDtoCopyWith<$Res> implements $ShoppingDtoCopyWith<$Res> {
  factory _$ShoppingDtoCopyWith(_ShoppingDto value, $Res Function(_ShoppingDto) _then) = __$ShoppingDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, ShoppingType type,@JsonKey(name: 'total_price') int totalPrice,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ShoppingDtoCopyWithImpl<$Res>
    implements _$ShoppingDtoCopyWith<$Res> {
  __$ShoppingDtoCopyWithImpl(this._self, this._then);

  final _ShoppingDto _self;
  final $Res Function(_ShoppingDto) _then;

/// Create a copy of ShoppingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? type = null,Object? totalPrice = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ShoppingDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShoppingType,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
