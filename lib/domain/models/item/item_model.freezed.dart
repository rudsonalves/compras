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

@JsonKey(name: 'shopping_id') String get shoppingId;@JsonKey(name: 'product_id') String get productId; int get prince; int get quantity;
/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemModelCopyWith<ItemModel> get copyWith => _$ItemModelCopyWithImpl<ItemModel>(this as ItemModel, _$identity);

  /// Serializes this ItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemModel&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.prince, prince) || other.prince == prince)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,prince,quantity);

@override
String toString() {
  return 'ItemModel(shoppingId: $shoppingId, productId: $productId, prince: $prince, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ItemModelCopyWith<$Res>  {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) _then) = _$ItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId, int prince, int quantity
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
@pragma('vm:prefer-inline') @override $Res call({Object? shoppingId = null,Object? productId = null,Object? prince = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,prince: null == prince ? _self.prince : prince // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ItemModel implements ItemModel {
  const _ItemModel({@JsonKey(name: 'shopping_id') required this.shoppingId, @JsonKey(name: 'product_id') required this.productId, required this.prince, this.quantity = 1});
  factory _ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

@override@JsonKey(name: 'shopping_id') final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String productId;
@override final  int prince;
@override@JsonKey() final  int quantity;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemModel&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.prince, prince) || other.prince == prince)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,prince,quantity);

@override
String toString() {
  return 'ItemModel(shoppingId: $shoppingId, productId: $productId, prince: $prince, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$ItemModelCopyWith(_ItemModel value, $Res Function(_ItemModel) _then) = __$ItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String productId, int prince, int quantity
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
@override @pragma('vm:prefer-inline') $Res call({Object? shoppingId = null,Object? productId = null,Object? prince = null,Object? quantity = null,}) {
  return _then(_ItemModel(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,prince: null == prince ? _self.prince : prince // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
