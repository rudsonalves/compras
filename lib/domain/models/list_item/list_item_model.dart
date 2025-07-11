import 'package:compras/domain/dto/list_item/list_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_item_model.freezed.dart';
part 'list_item_model.g.dart';

@freezed
abstract class ListItemModel with _$ListItemModel {
  const factory ListItemModel({
    required String id,
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') String? productId,
    required String name,
    @Default(1) int quantity,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ListItemModel;

  factory ListItemModel.create({
    required String id,
    required String shoppingId,
    String? productId,
    required String name,
    int quantity = 1,
  }) => ListItemModel(
    id: id,
    shoppingId: shoppingId,
    productId: productId,
    name: name,
    quantity: quantity,
    createdAt: DateTime.now(),
  );

  factory ListItemModel.fromJson(Map<String, dynamic> json) =>
      _$ListItemModelFromJson(json);

  factory ListItemModel.fromDto(String id, ListItemDto dto) => ListItemModel(
    id: id,
    shoppingId: dto.shoppingId,
    productId: dto.productId,
    name: dto.name,
    quantity: dto.quantity,
    createdAt: dto.createdAt,
  );
}
