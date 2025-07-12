import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/dto/last_price/last_price_dto.dart';

part 'last_price_model.freezed.dart';
part 'last_price_model.g.dart';

@freezed
abstract class LastPriceModel with _$LastPriceModel {
  const LastPriceModel._();

  const factory LastPriceModel({
    required String id,
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'last_unit_price') required int lastUnitPrice,
    @Default(true) @JsonKey(name: 'is_unit') bool isUnit,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _LastPriceModel;

  factory LastPriceModel.create({
    required String id,
    required String shoppingId,
    required String productId,
    bool isUnit = true,
    required int lastUnitPrice,
  }) {
    final now = DateTime.now();
    return LastPriceModel(
      id: id,
      shoppingId: shoppingId,
      productId: productId,
      isUnit: isUnit,
      lastUnitPrice: lastUnitPrice,
      createdAt: now,
    );
  }

  factory LastPriceModel.fromDto(String id, LastPriceDto lastPriceDto) =>
      LastPriceModel(
        id: id,
        shoppingId: lastPriceDto.shoppingId,
        productId: lastPriceDto.productId,
        isUnit: lastPriceDto.isUnit,
        lastUnitPrice: lastPriceDto.lastUnitPrice,
        createdAt: lastPriceDto.createdAt,
      );

  factory LastPriceModel.fromJson(Map<String, dynamic> json) =>
      _$LastPriceModelFromJson(json);
}
