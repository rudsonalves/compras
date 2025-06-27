// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastPriceModel {

 String get id;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'is_unit_price', fromJson: SqliteHelpers.intToBool, toJson: SqliteHelpers.boolToInt) bool get isUnitPrice;@JsonKey(name: 'last_unit_price') int get lastUnitPrice;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of LastPriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastPriceModelCopyWith<LastPriceModel> get copyWith => _$LastPriceModelCopyWithImpl<LastPriceModel>(this as LastPriceModel, _$identity);

  /// Serializes this LastPriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastPriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isUnitPrice, isUnitPrice) || other.isUnitPrice == isUnitPrice)&&(identical(other.lastUnitPrice, lastUnitPrice) || other.lastUnitPrice == lastUnitPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,isUnitPrice,lastUnitPrice,createdAt);

@override
String toString() {
  return 'LastPriceModel(id: $id, productId: $productId, isUnitPrice: $isUnitPrice, lastUnitPrice: $lastUnitPrice, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LastPriceModelCopyWith<$Res>  {
  factory $LastPriceModelCopyWith(LastPriceModel value, $Res Function(LastPriceModel) _then) = _$LastPriceModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'is_unit_price', fromJson: SqliteHelpers.intToBool, toJson: SqliteHelpers.boolToInt) bool isUnitPrice,@JsonKey(name: 'last_unit_price') int lastUnitPrice,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$LastPriceModelCopyWithImpl<$Res>
    implements $LastPriceModelCopyWith<$Res> {
  _$LastPriceModelCopyWithImpl(this._self, this._then);

  final LastPriceModel _self;
  final $Res Function(LastPriceModel) _then;

/// Create a copy of LastPriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? isUnitPrice = null,Object? lastUnitPrice = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,isUnitPrice: null == isUnitPrice ? _self.isUnitPrice : isUnitPrice // ignore: cast_nullable_to_non_nullable
as bool,lastUnitPrice: null == lastUnitPrice ? _self.lastUnitPrice : lastUnitPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LastPriceModel extends LastPriceModel {
  const _LastPriceModel({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'is_unit_price', fromJson: SqliteHelpers.intToBool, toJson: SqliteHelpers.boolToInt) this.isUnitPrice = true, @JsonKey(name: 'last_unit_price') required this.lastUnitPrice, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _LastPriceModel.fromJson(Map<String, dynamic> json) => _$LastPriceModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'is_unit_price', fromJson: SqliteHelpers.intToBool, toJson: SqliteHelpers.boolToInt) final  bool isUnitPrice;
@override@JsonKey(name: 'last_unit_price') final  int lastUnitPrice;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of LastPriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastPriceModelCopyWith<_LastPriceModel> get copyWith => __$LastPriceModelCopyWithImpl<_LastPriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LastPriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastPriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isUnitPrice, isUnitPrice) || other.isUnitPrice == isUnitPrice)&&(identical(other.lastUnitPrice, lastUnitPrice) || other.lastUnitPrice == lastUnitPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,isUnitPrice,lastUnitPrice,createdAt);

@override
String toString() {
  return 'LastPriceModel(id: $id, productId: $productId, isUnitPrice: $isUnitPrice, lastUnitPrice: $lastUnitPrice, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LastPriceModelCopyWith<$Res> implements $LastPriceModelCopyWith<$Res> {
  factory _$LastPriceModelCopyWith(_LastPriceModel value, $Res Function(_LastPriceModel) _then) = __$LastPriceModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'is_unit_price', fromJson: SqliteHelpers.intToBool, toJson: SqliteHelpers.boolToInt) bool isUnitPrice,@JsonKey(name: 'last_unit_price') int lastUnitPrice,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$LastPriceModelCopyWithImpl<$Res>
    implements _$LastPriceModelCopyWith<$Res> {
  __$LastPriceModelCopyWithImpl(this._self, this._then);

  final _LastPriceModel _self;
  final $Res Function(_LastPriceModel) _then;

/// Create a copy of LastPriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? isUnitPrice = null,Object? lastUnitPrice = null,Object? createdAt = freezed,}) {
  return _then(_LastPriceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,isUnitPrice: null == isUnitPrice ? _self.isUnitPrice : isUnitPrice // ignore: cast_nullable_to_non_nullable
as bool,lastUnitPrice: null == lastUnitPrice ? _self.lastUnitPrice : lastUnitPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
