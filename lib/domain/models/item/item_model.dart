import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    required int prince,
    @Default(1) int quantity,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
