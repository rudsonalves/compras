// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListItemModel {

 String get id;@JsonKey(name: 'shopping_id') String get shoppingId;@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'is_unit') bool get isUnit; String get name; int get quantity;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListItemModelCopyWith<ListItemModel> get copyWith => _$ListItemModelCopyWithImpl<ListItemModel>(this as ListItemModel, _$identity);

  /// Serializes this ListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isUnit, isUnit) || other.isUnit == isUnit)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shoppingId,productId,isUnit,name,quantity,createdAt);

@override
String toString() {
  return 'ListItemModel(id: $id, shoppingId: $shoppingId, productId: $productId, isUnit: $isUnit, name: $name, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ListItemModelCopyWith<$Res>  {
  factory $ListItemModelCopyWith(ListItemModel value, $Res Function(ListItemModel) _then) = _$ListItemModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'is_unit') bool isUnit, String name, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ListItemModelCopyWithImpl<$Res>
    implements $ListItemModelCopyWith<$Res> {
  _$ListItemModelCopyWithImpl(this._self, this._then);

  final ListItemModel _self;
  final $Res Function(ListItemModel) _then;

/// Create a copy of ListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shoppingId = null,Object? productId = freezed,Object? isUnit = null,Object? name = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,isUnit: null == isUnit ? _self.isUnit : isUnit // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ListItemModel implements ListItemModel {
  const _ListItemModel({required this.id, @JsonKey(name: 'shopping_id') required this.shoppingId, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'is_unit') this.isUnit = true, required this.name, this.quantity = 1, @JsonKey(name: 'created_at') this.createdAt});
  factory _ListItemModel.fromJson(Map<String, dynamic> json) => _$ListItemModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'shopping_id') final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'is_unit') final  bool isUnit;
@override final  String name;
@override@JsonKey() final  int quantity;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListItemModelCopyWith<_ListItemModel> get copyWith => __$ListItemModelCopyWithImpl<_ListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.isUnit, isUnit) || other.isUnit == isUnit)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shoppingId,productId,isUnit,name,quantity,createdAt);

@override
String toString() {
  return 'ListItemModel(id: $id, shoppingId: $shoppingId, productId: $productId, isUnit: $isUnit, name: $name, quantity: $quantity, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ListItemModelCopyWith<$Res> implements $ListItemModelCopyWith<$Res> {
  factory _$ListItemModelCopyWith(_ListItemModel value, $Res Function(_ListItemModel) _then) = __$ListItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'shopping_id') String shoppingId,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'is_unit') bool isUnit, String name, int quantity,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ListItemModelCopyWithImpl<$Res>
    implements _$ListItemModelCopyWith<$Res> {
  __$ListItemModelCopyWithImpl(this._self, this._then);

  final _ListItemModel _self;
  final $Res Function(_ListItemModel) _then;

/// Create a copy of ListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shoppingId = null,Object? productId = freezed,Object? isUnit = null,Object? name = null,Object? quantity = null,Object? createdAt = freezed,}) {
  return _then(_ListItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,isUnit: null == isUnit ? _self.isUnit : isUnit // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
