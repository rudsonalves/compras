import 'package:freezed_annotation/freezed_annotation.dart';

import '/domain/dto/last_price/last_price_dto.dart';
import '/domain/models/sqlite_helpers.dart';

part 'last_price_model.freezed.dart';
part 'last_price_model.g.dart';

@freezed
abstract class LastPriceModel with _$LastPriceModel {
  const LastPriceModel._();

  const factory LastPriceModel({
    required String id,
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
  }) = _LastPriceModel;

  factory LastPriceModel.create({
    required String id,
    required String productId,
    bool isUnitPrice = true,
    required int lastUnitPrice,
  }) {
    final now = DateTime.now();
    return LastPriceModel(
      id: id,
      productId: productId,
      isUnitPrice: isUnitPrice,
      lastUnitPrice: lastUnitPrice,
      createdAt: now,
    );
  }

  factory LastPriceModel.fromDto(String id, LastPriceDto lastPriceDto) =>
      LastPriceModel(
        id: id,
        productId: lastPriceDto.productId,
        isUnitPrice: lastPriceDto.isUnitPrice,
        lastUnitPrice: lastPriceDto.lastUnitPrice,
        createdAt: lastPriceDto.createdAt,
      );

  factory LastPriceModel.fromJson(Map<String, dynamic> json) =>
      _$LastPriceModelFromJson(json);
}
