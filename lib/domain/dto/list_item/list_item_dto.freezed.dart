// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListItemDto {

@JsonKey(name: 'shopping_id') String get shoppingId;@JsonKey(name: 'product_id') String? get productId; String get name; int get quantity;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListItemDtoCopyWith<ListItemDto> get copyWith => _$ListItemDtoCopyWithImpl<ListItemDto>(this as ListItemDto, _$identity);

  /// Serializes this ListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListItemDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,name,quantity,createdAt);

@override
String toString() {
  return 'ListItemDto(shoppingId: $shoppingId, productId: $productId, name: $name, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ListItemDtoCopyWith<$Res>  {
  factory $ListItemDtoCopyWith(ListItemDto value, $Res Function(ListItemDto) _then) = _$ListItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String? productId, String name, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ListItemDtoCopyWithImpl<$Res>
    implements $ListItemDtoCopyWith<$Res> {
  _$ListItemDtoCopyWithImpl(this._self, this._then);

  final ListItemDto _self;
  final $Res Function(ListItemDto) _then;

/// Create a copy of ListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shoppingId = null,Object? productId = freezed,Object? name = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ListItemDto implements ListItemDto {
  const _ListItemDto({@JsonKey(name: 'shopping_id') required this.shoppingId, @JsonKey(name: 'product_id') this.productId, required this.name, this.quantity = 1, @JsonKey(name: 'created_at') this.createdAt});
  factory _ListItemDto.fromJson(Map<String, dynamic> json) => _$ListItemDtoFromJson(json);

@override@JsonKey(name: 'shopping_id') final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String? productId;
@override final  String name;
@override@JsonKey() final  int quantity;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListItemDtoCopyWith<_ListItemDto> get copyWith => __$ListItemDtoCopyWithImpl<_ListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListItemDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,name,quantity,createdAt);

@override
String toString() {
  return 'ListItemDto(shoppingId: $shoppingId, productId: $productId, name: $name, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ListItemDtoCopyWith<$Res> implements $ListItemDtoCopyWith<$Res> {
  factory _$ListItemDtoCopyWith(_ListItemDto value, $Res Function(_ListItemDto) _then) = __$ListItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String? productId, String name, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ListItemDtoCopyWithImpl<$Res>
    implements _$ListItemDtoCopyWith<$Res> {
  __$ListItemDtoCopyWithImpl(this._self, this._then);

  final _ListItemDto _self;
  final $Res Function(_ListItemDto) _then;

/// Create a copy of ListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shoppingId = null,Object? productId = freezed,Object? name = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_ListItemDto(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
