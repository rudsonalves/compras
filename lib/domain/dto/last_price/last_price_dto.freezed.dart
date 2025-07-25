// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastPriceDto {

@JsonKey(name: 'shopping_id') String get shoppingId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'sale_by') SaleBy get saleBy;@JsonKey(name: 'last_unit_price') int get lastUnitPrice;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of LastPriceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastPriceDtoCopyWith<LastPriceDto> get copyWith => _$LastPriceDtoCopyWithImpl<LastPriceDto>(this as LastPriceDto, _$identity);

  /// Serializes this LastPriceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastPriceDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.lastUnitPrice, lastUnitPrice) || other.lastUnitPrice == lastUnitPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,saleBy,lastUnitPrice,createdAt);

@override
String toString() {
  return 'LastPriceDto(shoppingId: $shoppingId, productId: $productId, saleBy: $saleBy, lastUnitPrice: $lastUnitPrice, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LastPriceDtoCopyWith<$Res>  {
  factory $LastPriceDtoCopyWith(LastPriceDto value, $Res Function(LastPriceDto) _then) = _$LastPriceDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'last_unit_price') int lastUnitPrice,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$LastPriceDtoCopyWithImpl<$Res>
    implements $LastPriceDtoCopyWith<$Res> {
  _$LastPriceDtoCopyWithImpl(this._self, this._then);

  final LastPriceDto _self;
  final $Res Function(LastPriceDto) _then;

/// Create a copy of LastPriceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shoppingId = null,Object? productId = null,Object? saleBy = null,Object? lastUnitPrice = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,lastUnitPrice: null == lastUnitPrice ? _self.lastUnitPrice : lastUnitPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LastPriceDto extends LastPriceDto {
  const _LastPriceDto({@JsonKey(name: 'shopping_id') required this.shoppingId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'sale_by') required this.saleBy, @JsonKey(name: 'last_unit_price') required this.lastUnitPrice, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _LastPriceDto.fromJson(Map<String, dynamic> json) => _$LastPriceDtoFromJson(json);

@override@JsonKey(name: 'shopping_id') final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'sale_by') final  SaleBy saleBy;
@override@JsonKey(name: 'last_unit_price') final  int lastUnitPrice;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of LastPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastPriceDtoCopyWith<_LastPriceDto> get copyWith => __$LastPriceDtoCopyWithImpl<_LastPriceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LastPriceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastPriceDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.lastUnitPrice, lastUnitPrice) || other.lastUnitPrice == lastUnitPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,saleBy,lastUnitPrice,createdAt);

@override
String toString() {
  return 'LastPriceDto(shoppingId: $shoppingId, productId: $productId, saleBy: $saleBy, lastUnitPrice: $lastUnitPrice, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LastPriceDtoCopyWith<$Res> implements $LastPriceDtoCopyWith<$Res> {
  factory _$LastPriceDtoCopyWith(_LastPriceDto value, $Res Function(_LastPriceDto) _then) = __$LastPriceDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'last_unit_price') int lastUnitPrice,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$LastPriceDtoCopyWithImpl<$Res>
    implements _$LastPriceDtoCopyWith<$Res> {
  __$LastPriceDtoCopyWithImpl(this._self, this._then);

  final _LastPriceDto _self;
  final $Res Function(_LastPriceDto) _then;

/// Create a copy of LastPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shoppingId = null,Object? productId = null,Object? saleBy = null,Object? lastUnitPrice = null,Object? createdAt = freezed,}) {
  return _then(_LastPriceDto(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,lastUnitPrice: null == lastUnitPrice ? _self.lastUnitPrice : lastUnitPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
