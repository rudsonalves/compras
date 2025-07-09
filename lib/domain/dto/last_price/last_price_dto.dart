import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/enums/enums.dart';

part 'last_price_dto.freezed.dart';
part 'last_price_dto.g.dart';

@freezed
abstract class LastPriceDto with _$LastPriceDto {
  const LastPriceDto._();

  const factory LastPriceDto({
    @JsonKey(name: 'shopping_id') required String shoppingId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'sale_by') required SaleBy saleBy,
    @JsonKey(name: 'last_unit_price') required int lastUnitPrice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _LastPriceDto;

  factory LastPriceDto.create({
    required String shoppingId,
    required String productId,
    SaleBy saleBy = SaleBy.unit,
    required int lastPrice,
  }) {
    final now = DateTime.now();
    return LastPriceDto(
      shoppingId: shoppingId,
      productId: productId,
      saleBy: saleBy,
      lastUnitPrice: lastPrice,
      createdAt: now,
    );
  }

  factory LastPriceDto.fromJson(Map<String, dynamic> json) =>
      _$LastPriceDtoFromJson(json);
}
