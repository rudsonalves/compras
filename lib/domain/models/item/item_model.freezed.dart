// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemModel {

@JsonKey(name: 'shopping_id') String get shoppingId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'sale_by') SaleBy get saleBy;@JsonKey(name: 'unit_price') int get unitPrince; int get quantity;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemModelCopyWith<ItemModel> get copyWith => _$ItemModelCopyWithImpl<ItemModel>(this as ItemModel, _$identity);

  /// Serializes this ItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemModel&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.unitPrince, unitPrince) || other.unitPrince == unitPrince)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,saleBy,unitPrince,quantity,createdAt);

@override
String toString() {
  return 'ItemModel(shoppingId: $shoppingId, productId: $productId, saleBy: $saleBy, unitPrince: $unitPrince, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ItemModelCopyWith<$Res>  {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) _then) = _$ItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'unit_price') int unitPrince, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ItemModelCopyWithImpl<$Res>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._self, this._then);

  final ItemModel _self;
  final $Res Function(ItemModel) _then;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shoppingId = null,Object? productId = null,Object? saleBy = null,Object? unitPrince = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,unitPrince: null == unitPrince ? _self.unitPrince : unitPrince // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ItemModel implements ItemModel {
  const _ItemModel({@JsonKey(name: 'shopping_id') required this.shoppingId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'sale_by') this.saleBy = SaleBy.unit, @JsonKey(name: 'unit_price') required this.unitPrince, this.quantity = 1, @JsonKey(name: 'created_at') this.createdAt});
  factory _ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

@override@JsonKey(name: 'shopping_id') final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'sale_by') final  SaleBy saleBy;
@override@JsonKey(name: 'unit_price') final  int unitPrince;
@override@JsonKey() final  int quantity;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemModelCopyWith<_ItemModel> get copyWith => __$ItemModelCopyWithImpl<_ItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemModel&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.unitPrince, unitPrince) || other.unitPrince == unitPrince)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,saleBy,unitPrince,quantity,createdAt);

@override
String toString() {
  return 'ItemModel(shoppingId: $shoppingId, productId: $productId, saleBy: $saleBy, unitPrince: $unitPrince, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$ItemModelCopyWith(_ItemModel value, $Res Function(_ItemModel) _then) = __$ItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'unit_price') int unitPrince, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ItemModelCopyWithImpl<$Res>
    implements _$ItemModelCopyWith<$Res> {
  __$ItemModelCopyWithImpl(this._self, this._then);

  final _ItemModel _self;
  final $Res Function(_ItemModel) _then;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shoppingId = null,Object? productId = null,Object? saleBy = null,Object? unitPrince = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_ItemModel(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,unitPrince: null == unitPrince ? _self.unitPrince : unitPrince // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
