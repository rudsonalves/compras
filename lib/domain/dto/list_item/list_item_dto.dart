import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_item_dto.freezed.dart';
part 'list_item_dto.g.dart';

@freezed
abstract class ListItemDto with _$ListItemDto {
  const factory ListItemDto({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') String? productId,
    required String name,
    @Default(1) int quantity,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ListItemDto;

  factory ListItemDto.create({
    required String shoppingId,
    String? productId,
    required String name,
    int quantity = 1,
  }) => ListItemDto(
    shoppingId: shoppingId,
    productId: productId,
    name: name,
    quantity: quantity,
    createdAt: DateTime.now(),
  );

  factory ListItemDto.fromJson(Map<String, dynamic> json) =>
      _$ListItemDtoFromJson(json);
}
