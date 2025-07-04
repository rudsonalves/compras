import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/models/sqlite_helpers.dart';
part 'last_price_dto.freezed.dart';
part 'last_price_dto.g.dart';

@freezed
abstract class LastPriceDto with _$LastPriceDto {
  const LastPriceDto._();

  const factory LastPriceDto({
    @JsonKey(name: 'product_id') required String productId,
    @Default(true)
    @JsonKey(
      name: 'is_unit_price',
      fromJson: SqliteHelpers.intToBool,
      toJson: SqliteHelpers.boolToInt,
    )
    bool isUnitPrice,
    @JsonKey(name: 'last_unit_price') required int lastUnitPrice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _LastPriceDto;

  factory LastPriceDto.create({
    required String productId,
    bool isUnitPrice = true,
    required int lastPrice,
  }) {
    final now = DateTime.now();
    return LastPriceDto(
      productId: productId,
      isUnitPrice: isUnitPrice,
      lastUnitPrice: lastPrice,
      createdAt: now,
    );
  }

  factory LastPriceDto.fromJson(Map<String, dynamic> json) =>
      _$LastPriceDtoFromJson(json);
}
