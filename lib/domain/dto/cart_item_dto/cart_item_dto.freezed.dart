// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartItemDto {

 String get shoppingId;@JsonKey(name: 'product_id') String? get productId; String get name; String? get description;@JsonKey(name: 'bar_code') String? get barCode;@JsonKey(name: 'sale_by') SaleBy get saleBy;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'category') String? get categoryName;@JsonKey(name: 'sub_category_id') String? get subCategoryId;@JsonKey(name: 'sub_category') String? get subCategoryName; int get price; int get quantity;
/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemDtoCopyWith<CartItemDto> get copyWith => _$CartItemDtoCopyWithImpl<CartItemDto>(this as CartItemDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.barCode, barCode) || other.barCode == barCode)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,name,description,barCode,saleBy,categoryId,categoryName,subCategoryId,subCategoryName,price,quantity);

@override
String toString() {
  return 'CartItemDto(shoppingId: $shoppingId, productId: $productId, name: $name, description: $description, barCode: $barCode, saleBy: $saleBy, categoryId: $categoryId, categoryName: $categoryName, subCategoryId: $subCategoryId, subCategoryName: $subCategoryName, price: $price, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CartItemDtoCopyWith<$Res>  {
  factory $CartItemDtoCopyWith(CartItemDto value, $Res Function(CartItemDto) _then) = _$CartItemDtoCopyWithImpl;
@useResult
$Res call({
 String shoppingId,@JsonKey(name: 'product_id') String? productId, String name, String? description,@JsonKey(name: 'bar_code') String? barCode,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'category') String? categoryName,@JsonKey(name: 'sub_category_id') String? subCategoryId,@JsonKey(name: 'sub_category') String? subCategoryName, int price, int quantity
});




}
/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._self, this._then);

  final CartItemDto _self;
  final $Res Function(CartItemDto) _then;

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shoppingId = null,Object? productId = freezed,Object? name = null,Object? description = freezed,Object? barCode = freezed,Object? saleBy = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? subCategoryId = freezed,Object? subCategoryName = freezed,Object? price = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,barCode: freezed == barCode ? _self.barCode : barCode // ignore: cast_nullable_to_non_nullable
as String?,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryName: freezed == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _CartItemDto implements CartItemDto {
  const _CartItemDto({required this.shoppingId, @JsonKey(name: 'product_id') this.productId, required this.name, this.description, @JsonKey(name: 'bar_code') this.barCode, @JsonKey(name: 'sale_by') this.saleBy = SaleBy.unit, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'category') this.categoryName, @JsonKey(name: 'sub_category_id') this.subCategoryId, @JsonKey(name: 'sub_category') this.subCategoryName, this.price = 0, this.quantity = 1});
  

@override final  String shoppingId;
@override@JsonKey(name: 'product_id') final  String? productId;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'bar_code') final  String? barCode;
@override@JsonKey(name: 'sale_by') final  SaleBy saleBy;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'category') final  String? categoryName;
@override@JsonKey(name: 'sub_category_id') final  String? subCategoryId;
@override@JsonKey(name: 'sub_category') final  String? subCategoryName;
@override@JsonKey() final  int price;
@override@JsonKey() final  int quantity;

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemDtoCopyWith<_CartItemDto> get copyWith => __$CartItemDtoCopyWithImpl<_CartItemDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemDto&&(identical(other.shoppingId, shoppingId) || other.shoppingId == shoppingId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.barCode, barCode) || other.barCode == barCode)&&(identical(other.saleBy, saleBy) || other.saleBy == saleBy)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,shoppingId,productId,name,description,barCode,saleBy,categoryId,categoryName,subCategoryId,subCategoryName,price,quantity);

@override
String toString() {
  return 'CartItemDto(shoppingId: $shoppingId, productId: $productId, name: $name, description: $description, barCode: $barCode, saleBy: $saleBy, categoryId: $categoryId, categoryName: $categoryName, subCategoryId: $subCategoryId, subCategoryName: $subCategoryName, price: $price, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CartItemDtoCopyWith<$Res> implements $CartItemDtoCopyWith<$Res> {
  factory _$CartItemDtoCopyWith(_CartItemDto value, $Res Function(_CartItemDto) _then) = __$CartItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String shoppingId,@JsonKey(name: 'product_id') String? productId, String name, String? description,@JsonKey(name: 'bar_code') String? barCode,@JsonKey(name: 'sale_by') SaleBy saleBy,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'category') String? categoryName,@JsonKey(name: 'sub_category_id') String? subCategoryId,@JsonKey(name: 'sub_category') String? subCategoryName, int price, int quantity
});




}
/// @nodoc
class __$CartItemDtoCopyWithImpl<$Res>
    implements _$CartItemDtoCopyWith<$Res> {
  __$CartItemDtoCopyWithImpl(this._self, this._then);

  final _CartItemDto _self;
  final $Res Function(_CartItemDto) _then;

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shoppingId = null,Object? productId = freezed,Object? name = null,Object? description = freezed,Object? barCode = freezed,Object? saleBy = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? subCategoryId = freezed,Object? subCategoryName = freezed,Object? price = null,Object? quantity = null,}) {
  return _then(_CartItemDto(
shoppingId: null == shoppingId ? _self.shoppingId : shoppingId // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,barCode: freezed == barCode ? _self.barCode : barCode // ignore: cast_nullable_to_non_nullable
as String?,saleBy: null == saleBy ? _self.saleBy : saleBy // ignore: cast_nullable_to_non_nullable
as SaleBy,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as String?,subCategoryName: freezed == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
