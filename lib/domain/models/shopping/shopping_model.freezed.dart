// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingModel {

 String get id; String get name; String get description; ShoppingType get type;@JsonKey(name: 'total_price') int get totalPrice;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ShoppingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingModelCopyWith<ShoppingModel> get copyWith => _$ShoppingModelCopyWithImpl<ShoppingModel>(this as ShoppingModel, _$identity);

  /// Serializes this ShoppingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingModel(id: $id, name: $name, description: $description, type: $type, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingModelCopyWith<$Res>  {
  factory $ShoppingModelCopyWith(ShoppingModel value, $Res Function(ShoppingModel) _then) = _$ShoppingModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, ShoppingType type,@JsonKey(name: 'total_price') int totalPrice,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ShoppingModelCopyWithImpl<$Res>
    implements $ShoppingModelCopyWith<$Res> {
  _$ShoppingModelCopyWithImpl(this._self, this._then);

  final ShoppingModel _self;
  final $Res Function(ShoppingModel) _then;

/// Create a copy of ShoppingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? totalPrice = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShoppingType,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShoppingModel extends ShoppingModel {
  const _ShoppingModel({required this.id, required this.name, required this.description, required this.type, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _ShoppingModel.fromJson(Map<String, dynamic> json) => _$ShoppingModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  ShoppingType type;
@override@JsonKey(name: 'total_price') final  int totalPrice;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ShoppingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingModelCopyWith<_ShoppingModel> get copyWith => __$ShoppingModelCopyWithImpl<_ShoppingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingModel(id: $id, name: $name, description: $description, type: $type, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingModelCopyWith<$Res> implements $ShoppingModelCopyWith<$Res> {
  factory _$ShoppingModelCopyWith(_ShoppingModel value, $Res Function(_ShoppingModel) _then) = __$ShoppingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, ShoppingType type,@JsonKey(name: 'total_price') int totalPrice,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ShoppingModelCopyWithImpl<$Res>
    implements _$ShoppingModelCopyWith<$Res> {
  __$ShoppingModelCopyWithImpl(this._self, this._then);

  final _ShoppingModel _self;
  final $Res Function(_ShoppingModel) _then;

/// Create a copy of ShoppingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? totalPrice = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ShoppingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ShoppingType,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
