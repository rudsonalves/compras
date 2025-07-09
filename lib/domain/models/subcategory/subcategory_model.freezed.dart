// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subcategory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubcategoryModel {

 String get id;@JsonKey(name: 'category_id') String get categoryId; String get name;
/// Create a copy of SubcategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubcategoryModelCopyWith<SubcategoryModel> get copyWith => _$SubcategoryModelCopyWithImpl<SubcategoryModel>(this as SubcategoryModel, _$identity);

  /// Serializes this SubcategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubcategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name);

@override
String toString() {
  return 'SubcategoryModel(id: $id, categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class $SubcategoryModelCopyWith<$Res>  {
  factory $SubcategoryModelCopyWith(SubcategoryModel value, $Res Function(SubcategoryModel) _then) = _$SubcategoryModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class _$SubcategoryModelCopyWithImpl<$Res>
    implements $SubcategoryModelCopyWith<$Res> {
  _$SubcategoryModelCopyWithImpl(this._self, this._then);

  final SubcategoryModel _self;
  final $Res Function(SubcategoryModel) _then;

/// Create a copy of SubcategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubcategoryModel implements SubcategoryModel {
  const _SubcategoryModel({required this.id, @JsonKey(name: 'category_id') required this.categoryId, required this.name});
  factory _SubcategoryModel.fromJson(Map<String, dynamic> json) => _$SubcategoryModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  String name;

/// Create a copy of SubcategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubcategoryModelCopyWith<_SubcategoryModel> get copyWith => __$SubcategoryModelCopyWithImpl<_SubcategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubcategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubcategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name);

@override
String toString() {
  return 'SubcategoryModel(id: $id, categoryId: $categoryId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SubcategoryModelCopyWith<$Res> implements $SubcategoryModelCopyWith<$Res> {
  factory _$SubcategoryModelCopyWith(_SubcategoryModel value, $Res Function(_SubcategoryModel) _then) = __$SubcategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'category_id') String categoryId, String name
});




}
/// @nodoc
class __$SubcategoryModelCopyWithImpl<$Res>
    implements _$SubcategoryModelCopyWith<$Res> {
  __$SubcategoryModelCopyWithImpl(this._self, this._then);

  final _SubcategoryModel _self;
  final $Res Function(_SubcategoryModel) _then;

/// Create a copy of SubcategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? name = null,}) {
  return _then(_SubcategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
